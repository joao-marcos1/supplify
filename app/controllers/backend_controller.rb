require 'action_web_service'

class BackendController < ContentController
  skip_before_filter :verify_authenticity_token
  cache_sweeper :blog_sweeper

  self.web_service_dispatching_mode = :layered
  self.web_service_exception_reporting = false

  web_service(:metaWeblog)  { MetaWeblog::Service.new(self) }
  web_service(:mt)          { MovableTypeService.new(self) }
  web_service(:blogger)     { BloggerService.new(self) }

  def xmlrpc
    api
  end

  def api
    dispatch_web_service_request
  end
end
