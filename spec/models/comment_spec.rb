require 'spec_helper'

require 'dns_mock'

describe Comment do

  def valid_comment(options={})
    Comment.new({:author => 'Bob',
                :article_id => contents(:article1).id,
                :body => 'nice post',
                :ip => '1.2.3.4'}.merge(options))
  end

  describe '#permalink_url' do
    it 'should render permalink to comment in public part' do
      c = feedback(:old_comment)
      assert_equal "http://myblog.net/2004/05/01/inactive-article#comment-#{c.id}", c.permalink_url
    end
  end

  describe '#edit_url' do
    it 'should get a url where edit comment in admin' do
      c = feedback(:old_comment)
      assert_equal "http://myblog.net/admin/comments/edit/#{c.id}", c.edit_url
    end
  end

  describe '#delete_url' do
    it 'should get the delete url of comment in admin part' do
      c = feedback(:old_comment)
      assert_equal "http://myblog.net/admin/comments/destroy/#{c.id}", c.delete_url
    end
  end

  describe '#save' do

    it 'should save good comment' do
      assert feedback(:comment2).save
      assert_equal "http://www.google.com", feedback(:comment2).url
    end

    it 'should save spam comment' do
      assert feedback(:spam_comment).save
      assert_equal "http://fakeurl.com", feedback(:spam_comment).url
    end

    it 'should not save in invalid article' do
      c = valid_comment(:author => "Old Spammer",
                        :body => "Old trackback body",
                        :article => contents(:inactive_article))

      assert ! c.save
      assert c.errors.invalid?('article_id')

      c.article = contents(:article1)

      assert c.save
      assert c.errors.empty?
    end

    it 'should change old comment' do
      c = contents(:inactive_article).comments.first
      c.body = 'Comment body <em>italic</em> <strong>bold</strong>'
      assert c.save
      assert c.errors.empty?
    end

    it 'should save a valid comment' do
      c = valid_comment # article created 2 days ago
      c.save.should be_true
      c.errors.should be_empty
    end

    it 'should not save with article not allow comment'  do
      b = Blog.default
      b.sp_article_auto_close = 1
      b.save

      c = valid_comment # article created 2 days ago
      c.save.should_not be_true
      c.errors.should_not be_empty
    end

  end

  describe '#create' do

    it 'should create comment' do
      c = valid_comment
      assert c.save
      assert c.guid.size > 15
    end

  end

  describe '#spam?' do
    it 'should reject spam rbl' do
      c = valid_comment(:author => "Spammer",
                        :body => %{This is just some random text. &lt;a href="http://chinaaircatering.com"&gt;without any senses.&lt;/a&gt;. Please disregard.},
                        :url => "http://buy-computer.us")
      should_be_spam(c)
    end

    it 'should not define spam a comment rbl with lookup succeeds' do
      c = valid_comment(:author => "Not a Spammer",
                        :body   => "Useful commentary!",
                        :url    => "http://www.bofh.org.uk")
      c.should_not be_spam
      c.should_not be_status_confirmed
    end

    it 'should reject spam with uri limit' do
      c = valid_comment(:author => "Yet Another Spammer",
                        :body => %{ <a href="http://www.one.com/">one</a> <a href="http://www.two.com/">two</a> <a href="http://www.three.com/">three</a> <a href="http://www.four.com/">four</a> },
                        :url => "http://www.uri-limit.com")
      should_be_spam(c)
    end

    def should_be_spam(comment)
      comment.should be_spam
      comment.should_not be_status_confirmed
    end

  end

  it 'should have good relation' do
    assert feedback(:comment2).article
    assert_equal contents(:article1), feedback(:comment2).article
  end

  describe 'reject xss' do
    before(:each) do
      @comment = Comment.new do |c|
        c.body = "Test foo <script>do_evil();</script>"
        c.author = 'Bob'
        c.article_id = contents(:article1).id
      end
    end
    ['','textile','markdown','smartypants','markdown smartypants'].each do |filter|
      it "should reject with filter #{filter}" do
        Blog.default.comment_text_filter = filter

        assert @comment.save
        assert @comment.errors.empty?

        assert @comment.html(:body) !~ /<script>/
      end
    end
  end

  describe 'change state' do
    it 'should becomes withdraw' do
      c = Comment.find(feedback(:comment2).id)
      assert c.withdraw!
      assert ! c.published?
      assert c.spam?
      assert c.status_confirmed?
      c.reload
      assert ! c.published?
      assert c.spam?
      assert c.status_confirmed?
    end

    it 'should becomes not published in article if withdraw' do
      a = Article.new(:title => 'foo')
      assert a.save

      assert_equal 0, a.published_comments.size
      c = a.comments.build(:body => 'foo', :author => 'bob', :published => true, :published_at => Time.now)
      assert c.save
      assert c.published?
      c.reload
      a.reload

      assert_equal 1, a.published_comments.size
      c.withdraw!

      a = Article.new(:title => 'foo')
      assert_equal 0, a.published_comments.size
    end

    it 'should becomes not confirmed in article if withdraw' do
      a = contents(:spammed_article)
      assert !a.comments[0].status_confirmed?
      assert  a.comments[1].status_confirmed?

      a.reload
      assert_equal 1,
        a.comments.find_all_by_status_confirmed(true).size
      assert_equal 1,
        a.comments.find_all_by_status_confirmed(true).size
      a.comments[0].withdraw!
      assert_equal 2,
        a.comments.find_all_by_status_confirmed(true).size
    end
  end

  it 'should have good default filter' do
    a = Comment.find(:first)
    assert_equal 'markdown', a.default_text_filter.name
  end

  describe 'with feedback moderation enabled' do
    before(:each) do
      @blog = Blog.default
      @blog.sp_global = false
      @blog.default_moderate_comments = true
      @blog.save!
    end

    it 'should save comment as presumably spam' do
      comment = Comment.new do |c|
        c.body = "Test foo"
        c.author = 'Bob'
        c.article_id = contents(:article1).id
      end
      assert comment.save!

      assert ! comment.published?
      assert comment.spam?
      assert ! comment.status_confirmed?
    end

    it 'should save comment as confirmed ham' do
      comment = Comment.new do |c|
        c.body = "Test foo"
        c.author = 'Bob'
        c.article_id = contents(:article1).id
        c.user_id = users(:tobi).id
      end
      assert comment.save!

      assert comment.published?
      assert comment.ham?
      assert comment.status_confirmed?

    end
  end

end
