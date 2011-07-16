class GroupingController < ContentController
  before_filter :auto_discovery_feed, :only => [:show, :index]
  layout :theme_layout
  cache_sweeper :blog_sweeper

  caches_page :index, :show, :if => Proc.new {|c|
    c.request.query_string == ''
  }

  class << self
    def grouping_class(klass = nil)
      if klass
        @grouping_class = klass
      end
      @grouping_class ||= \
        self.to_s \
        .sub(/Controller$/,'') \
        .singularize.constantize
    end

    def ivar_name
      @ivar_name ||= "@#{to_s.sub(/Controller$/, '').underscore}"
    end
  end

  def index
    set_noindex
    self.groupings = grouping_class.paginate(:page => params[:page], :per_page => 100)
    @page_title = "#{self.class.to_s.sub(/Controller$/,'')}"
    @keywords = ""
    @description = "#{_(self.class.to_s.sub(/Controller$/,''))} #{'for'} #{this_blog.blog_name}"
    @description << "#{_('page')} #{params[:page]}" if params[:page]
    render_index(groupings)
  end

  def show
    set_noindex
    @grouping = grouping_class.find_by_permalink(params[:id])
    return render_empty if @grouping.nil?

    @canonical_url = permalink_with_page @grouping, params[:page]
    @page_title = show_page_title_for @grouping, params[:page]
    @description = @grouping.description.to_s
    @keywords = keyword_from @grouping
    @articles = @grouping.published_articles.paginate(:page => params[:page], :per_page => 10)

    render_articles
  end

  protected

  def grouping_class
    self.class.grouping_class
  end

  def groupings=(groupings)
    instance_variable_set(self.class.ivar_name, groupings)
  end

  def groupings
    instance_variable_get(self.class.ivar_name)
  end

  def keyword_from grouping
    keywords = "" 
    keywords << grouping.keywords unless grouping.keywords.blank?
    keywords << this_blog.meta_keywords unless this_blog.meta_keywords.blank?
    keywords 
  end

  def show_page_title_for grouping, page
    title = "#{_(self.class.to_s.sub(/Controller$/,'').singularize)} #{grouping.name}, "

    if grouping.respond_to? :description and
        not grouping.description.nil?
      title += grouping.description
    else
      title += "#{_('everything about')} "
      if grouping.respond_to? :display_name and
          not grouping.display_name.nil?
        title += grouping.display_name
      else
        title += grouping.name
      end
    end
    title << " page " << page if page
    title
  end

  # For some reasons, the permalink_url does not take the pagination.
  def permalink_with_page grouping, page
    suffix = page.nil? ? "/" : "/page/#{page}/"
    grouping.permalink_url + suffix
  end

  def render_index(groupings)
    respond_to do |format|
      format.html do
        unless template_exists? "#{self.class.to_s.sub(/Controller$/,'').downcase}/index"
          @grouping_class = self.class.grouping_class
          @groupings = groupings
          render 'articles/groupings'
        end
      end
    end
  end

  def render_articles
    respond_to do |format|
      format.html do
        if @articles.empty?
          redirect_to this_blog.base_url, :status => 301
          return
        end

        render 'articles/index' unless template_exists? 'show'
      end

      format.atom { render_feed 'atom', @articles }
      format.rss  { render_feed 'rss', @articles }
    end
  end

  def render_feed(format, collection)
    @articles = collection[0,this_blog.limit_rss_display]
    render "articles/index_#{format}_feed", :layout => false
  end

  def render_empty
    @articles = []
    render_articles
  end

  private
  def set_noindex
    # irk there must be a better way to do this
    @noindex = 1 if (grouping_class.to_s.downcase == "tag" and this_blog.unindex_tags)
    @noindex = 1 if (grouping_class.to_s.downcase == "category" and this_blog.unindex_categories)
    @noindex = 1 unless params[:page].blank?
  end
end
