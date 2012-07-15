# coding: utf-8
require 'spec_helper'

describe Content do
  before do
    @blog = stub_model(Blog)
    Blog.stub(:default) { @blog }
    @content = Content.create
  end

  describe "#short_url" do
    before do
      @content.published = true
      @content.redirects.build :from_path => "foo", :to_path => "bar"
      @content.save
    end

    describe "normally" do
      before do
        @blog.stub(:base_url) { "http://myblog.net" }
      end

      it "returns the blog's base url combined with the redirection's from path" do
        @content.short_url.should == "http://myblog.net/foo"
      end
    end

    describe "when the blog is in a sub-uri" do
      before do
        @blog.stub(:base_url) { "http://myblog.net/blog" }
      end

      it "includes the sub-uri path" do
        @content.short_url.should == "http://myblog.net/blog/foo"
      end
    end
  end

  describe "#text_filter" do
    it "returns the blog's text filter by default" do
      @blog.should_receive(:text_filter_object).and_return "foo"
      @content.text_filter.should eq "foo"
    end
  end

  describe "#really_send_notifications" do
    it "sends notifications to interested users" do
      henri = mock_model(User)
      alice = mock_model(User)

      @content.should_receive(:notify_user_via_email).with henri
      @content.should_receive(:notify_user_via_email).with alice

      @content.should_receive(:interested_users).and_return([henri, alice])

      @content.really_send_notifications
    end
  end
end

