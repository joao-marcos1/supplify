class Admin::DashboardController < Admin::BaseController
  require 'open-uri'
  require 'time'
  require 'rexml/document'

  layout 'administration'

  def index
    @newposts = Article.count(:all, :conditions => ['published = ? and published_at > ?', true, current_user.last_venue])
    @newcomments = Feedback.count(:all, :conditions =>['state in (?,?) and published_at > ?', 'presumed_ham', 'ham', current_user.last_venue])
    comments
    lastposts
    popular
    statistics
    inbound_links
    typo_dev
  end

  def change_state
    return unless request.xhr?

    feedback = Feedback.find(params[:id])
    if (feedback.state.to_s.downcase == 'spam')
      feedback.mark_as_ham!
    else
      feedback.mark_as_spam!
    end

    template = (feedback.state.to_s.downcase == 'spam') ? 'spam' : 'ham'
    render(:update) do |page|
      if params[:context] != 'listing'
        page.visual_effect :hide, "feedback_#{feedback.id}"
      else
        page.replace("feedback_#{feedback.id}", :partial => template, :locals => {:comment => feedback})
      end
    end
  end
  
  private

  def statistics
    @statposts = Article.count_published_articles
    @statuserposts =  Article.count(:conditions => {:user_id => current_user.id, :state => 'published'})
    @statcomments = Comment.count(:all, :conditions => "state != 'spam'")
    @statspam = Comment.count(:all, :conditions => { :state => 'spam' })
    @presumedspam = Comment.count(:all, :conditions => { :state => 'presumed_spam' })
    @categories = Category.count(:all)
  end

  def comments
    @comments ||=
      Comment.find(:all,
                   :limit => 5,
                   :conditions => ['published = ?', true],
                   :order => 'created_at DESC')
  end

  def lastposts
    @recent_posts = Article.find(:all,
                                 :conditions => ["published = ?", true],
                                 :order => 'published_at DESC',
                                 :limit => 5)
  end

  def popular
    @bestof = Article.find(:all,
                           :select => 'contents.*, comment_counts.count AS comment_count',
                           :from => "contents, (SELECT feedback.article_id AS article_id, COUNT(feedback.id) as count FROM feedback WHERE feedback.state IN ('presumed_ham', 'ham') GROUP BY feedback.article_id ORDER BY count DESC LIMIT 9) AS comment_counts",
                           :conditions => ['comment_counts.article_id = contents.id AND published = ?', true],
                           :order => 'comment_counts.count DESC',
                           :limit => 5)
  end

  def inbound_links
    url = "http://blogsearch.google.com/blogsearch_feeds?q=link:#{this_blog.base_url}&num=3&output=rss"
    open(url) do |http|
      @inbound_links = parse_rss(http.read).reverse
    end
  rescue
    @inbound_links = nil
  end

  def typo_dev
    url = "http://blog.typosphere.org/articles.rss"
    open(url) do |http|
      @typo_links = parse_rss(http.read)[0..4]
    end
  rescue
    @typo_links = nil
  end

  private

  class RssItem < Struct.new(:link, :title, :description, :description_link, :date, :author)
    def to_s; title end
  end

  def parse_rss(body)
    xml = REXML::Document.new(body)

    items        = []
    link         = REXML::XPath.match(xml, "//channel/link/text()").first.value rescue ""
    title        = REXML::XPath.match(xml, "//channel/title/text()").first.value rescue ""

    REXML::XPath.each(xml, "//item/") do |elem|
      item = RssItem.new
      item.title       = REXML::XPath.match(elem, "title/text()").first.value rescue ""
      item.link        = REXML::XPath.match(elem, "link/text()").first.value rescue ""
      item.description = REXML::XPath.match(elem, "description/text()").first.value rescue ""
      item.author      = REXML::XPath.match(elem, "dc:publisher/text()").first.value rescue ""
      item.date        = Time.mktime(*ParseDate.parsedate(REXML::XPath.match(elem, "dc:date/text()").first.value)) rescue Time.now

      item.description_link = item.description
      item.description.gsub!(/<\/?a\b.*?>/, "") # remove all <a> tags
      items << item
    end

    items.sort_by { |item| item.date }
  end
end
