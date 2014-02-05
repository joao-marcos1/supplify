class Admin::SidebarController < Admin::BaseController
  def index
    @available = available
    @active = active_by_index
    @staged = staged_by_index
    @positionnal = @active.merge(@staged).values
    @positionnal << Sidebar.new # to let at least 1 sortable element
    # Reset the staged position based on the active position.
    #Sidebar.delete_all('active_position is null')
    flash_sidebars
  end

  def set_active
    # Get all available plugins
    klass_for = available.inject({}) do |hash, klass|
      hash.merge({ klass.short_name => klass })
    end

    # Get all already active plugins
    activemap = flash_sidebars.inject({}) do |h, sb_id|
      sb = Sidebar.find(sb_id.to_i)
      sb ? h.merge(sb.html_id => sb_id) : h
    end

    # Figure out which plugins are referenced by the params[:active] array and
    # lay them out in a easy accessible sequential array
    flash[:sidebars] = params[:active].map do |name|
      if klass_for.has_key?(name)
        new_sidebar_id = klass_for[name].create.id
        @new_item = Sidebar.find(new_sidebar_id)
        new_sidebar_id
      elsif activemap.has_key?(name)
        activemap[name]
      end
    end.compact
  end

  def remove
    flash[:sidebars] = flash_sidebars.reject do |sb_id|
      sb_id == params[:id].to_i
    end
    @element_to_remove = params[:element]
  end

  def publish
    Sidebar.apply_staging_on_active!
    PageCache.sweep_all
    redirect_to admin_sidebar_path
  end

  def staging
    sidebar = Sidebar.find_by_id(params[:sidebar_id])
    return render(text: "Can’t find sidebar #{sidebar.inspect}", status: 406) unless sidebar
    #sidebar.staged_position = params[:staged_position].to_i
    sidebar.setting(:staged_position, params[:staged_position].to_i)
    sidebar.save!
    @available = available
    @active = Sidebar.find(:all, :order => 'active_position ASC') unless @active
    respond_to do |format|
      format.js do 
        render :js => {sidebar.id => sidebar.staged_position }
      end
      format.html do
        render :partial => 'config'
      end
    end
  end

  # Callback for admin sidebar sortable plugin
  def sortable
    respond_to do |format|
      format.json do
        positionned_sidebar = staged_by_index.merge(active_by_index)
        flatten_array = positionned_sidebar.values
        sorted = params[:sidebar]
        flatten_array.each_with_index do |sidebar, index|
          sidebar.staged_position = sorted[index] unless sidebar.active_position == sorted[index]
        end
        Sidebar.transaction do
          flatten_array.map(&:save!)
        end
        @positionnal = staged_by_index.merge(active_by_index).values
        @positionnal << Sidebar.new # to let at least 1 sortable element
        @active = active_by_index
        @staged = staged_by_index
        render json: { html: render_to_string('admin/sidebar/_config.html.erb') }
      end
    end
  end

  protected

  def show_available
    render :partial => 'availables', :object => available
  end

  def available
    ::Sidebar.available_sidebars
  end

  def staged_by_index
    staged = ::Sidebar.where('`sidebars`.`staged_position` IS NOT NULL').order('staged_position')
    staged_h = {}
    staged.each do |s|
      staged_h[s.staged_position] = s
    end
    staged_h
  end

  def active_by_index
    active = ::Sidebar.where('`sidebars`.`active_position` IS NOT NULL').order('active_position')
    active_h = {}
    active.each do |s|
      active_h[s.active_position] = s
    end
    active_h
  end

  def flash_sidebars
    unless flash[:sidebars]
      begin
        active = Sidebar.find(:all, :order => 'active_position ASC')
        flash[:sidebars] = active.map {|sb| sb.id }
      rescue => e
        logger.error e
        # Avoiding the view to crash
        @active = []
        flash[:error] = I18n.t('admin.sidebar.index.error')
      end
    end
    flash[:sidebars]
  end

  helper_method :available
end
