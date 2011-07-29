require 'spec_helper'

describe Admin::RedirectsController do
  render_views

  before do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end

  describe "#index" do
    before(:each) do
      get :index
    end

    it 'should display index with redirects' do
      assert_template 'index'
      assigns(:redirects).should_not be_nil
    end

    it 'should have Settings as selected tab' do
      test_tabs "Settings"
    end

    it 'should have General settings, Write, Feedback, Cache, Users and Redirects with Redirects selected' do
      subtabs = ["General settings", "Write", "Feedback", "Cache", "Users", "Redirects"]
      test_subtabs(subtabs, "Redirects")
    end        

  end

  it "test_create" do
    lambda do
      post :edit, 'redirect' => { :from_path => "some/place", 
        :to_path => "somewhere/else" }
      assert_response :redirect, :action => 'index'
    end.should change(Redirect, :count)
  end

  describe "#edit" do
    before(:each) do
      get :edit, :id => Factory(:redirect).id
    end

    it 'should render new template with valid redirect' do
      assert_template 'new'
      assigns(:redirect).should_not be_nil
      assert assigns(:redirect).valid?
    end

    it 'should have Settings as selected tab' do
      test_tabs "Settings"
    end

    it 'should have a link back to list' do
      test_back_to_list
    end
  end

  it "test_update" do
    post :edit, :id => Factory(:redirect).id
    assert_response :redirect, :action => 'index'
  end

  describe "test_destroy" do
    before(:each) do
      @test_id = Factory(:redirect).id
      assert_not_nil Redirect.find(@test_id)
    end

    describe 'with GET' do
      before(:each) do
        get :destroy, :id => @test_id
      end

      it 'should render destroy template' do
        assert_response :success
        assert_template 'destroy'
      end

      it 'should have Settings as selected tab' do
        test_tabs "Settings"
      end

      it 'should have a link back to list' do
        response.should have_selector("ul#subtabs>li>a", :content => "Back to list")
      end
    end

    describe 'with POST' do
      before(:each) do
        post :destroy, :id => @test_id
      end

      it 'should redirect to index' do
        assert_response :redirect, :action => 'index'
      end

      it 'should have no more redirects' do
        assert_raise(ActiveRecord::RecordNotFound) { Redirect.find(@test_id) }
      end
    end
  end
end
