module ActionDispatch::Routing

  module RouteSetExtensions

    def url_for(options, route_name = nil, url_strategy = ActionDispatch::Routing::RouteSet::UNKNOWN)

      if options[:subdomain].respond_to? :call
        options[:subdomain] = options[:subdomain].call
      end

      if Rails.application.config.action_mailer.default_url_options[:subdomain].respond_to? :call
        options[:subdomain] ||= Rails.application.config.action_mailer.default_url_options[:subdomain].call
      end

      super(options, route_name, url_strategy)

    end
  end

  class RouteSet
    prepend RouteSetExtensions
  end

end
