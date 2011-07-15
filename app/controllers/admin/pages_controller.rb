# coding: utf-8
require 'base64'

class Admin::PagesController < Admin::BaseController
  layout "administration", :except => 'show'
  cache_sweeper :blog_sweeper

  def index
    @search = params[:search] ? params[:search] : {}
    @pages = Page.search_paginate(@search, :page => params[:page], :per_page => this_blog.admin_display_elements)
  end

  def show
    @page = Page.find(params[:id])
  end

  accents = { ['á','à','â','ä','ã','Ã','Ä','Â','À'] => 'a',
    ['é','è','ê','ë','Ë','É','È','Ê'] => 'e',
    ['í','ì','î','ï','I','Î','Ì'] => 'i',
    ['ó','ò','ô','ö','õ','Õ','Ö','Ô','Ò'] => 'o',
    ['œ'] => 'oe',
    ['ß'] => 'ss',
    ['ú','ù','û','ü','U','Û','Ù'] => 'u',
    ['ç','Ç'] => 'c'
  }

  FROM, TO = accents.inject(['','']) { |o,(k,v)|
    o[0] << k * '';
    o[1] << v * k.size
    o
  }

  def new
    @macros = TextFilter.available_filters.select { |filter| TextFilterPlugin::Macro > filter }
    @page = Page.new(params[:page])
    @page.user_id = current_user.id
    @page.text_filter ||= current_user.text_filter
    @images = Resource.paginate :page => 1, :conditions => "mime LIKE '%image%'", :order => 'created_at DESC', :per_page => 10
    if request.post?
      if @page.name.blank?
        @page.name = @page.title.tr(FROM, TO).gsub(/<[^>]*>/, '').to_url
      end
      @page.published_at = Time.now
      if @page.save
        set_shortened_url if @page.published
        flash[:notice] = _('Page was successfully created.')
        redirect_to :action => 'index'
      end
    end
  end

  def edit
    @macros = TextFilter.available_filters.select { |filter| TextFilterPlugin::Macro > filter }
    @images = Resource.paginate :page => 1, :conditions => "mime LIKE '%image%'", :order => 'created_at DESC', :per_page => 10
    @page = Page.find(params[:id])
    @page.attributes = params[:page]
    if request.post? and @page.save
      set_shortened_url if @page.published
      flash[:notice] = _('Page was successfully updated.')
      redirect_to :action => 'index'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    if request.post?
      @page.destroy
      redirect_to :action => 'index'
    end
  end

  def set_shortened_url
    # In a very short time, I'd like to have permalink modification generate a 301 redirect as well to
    # So I set this up the big way now

    return unless Redirect.find_by_to_path(@page.permalink_url).nil?

    red = Redirect.new
    red.from_path = red.shorten
    red.to_path = @page.permalink_url
    red.save
    @page.redirects << red
  end

  def insert_editor
    editor = (params[:editor].to_s =~ /simple|visual/) ? params[:editor].to_s : "visual"
    current_user.editor = editor
    current_user.save!

    render :partial => "#{params[:editor].to_s}_editor"
  end

end
