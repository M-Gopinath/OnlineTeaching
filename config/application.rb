require_relative 'boot'

require 'rails/all'
# require 'apartment/elevators/subdomain'
# require 'apartment/elevators/first_subdomain'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ThinkableLms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.middleware.insert_before Warden::Manager, Apartment::Elevators::FirstSubdomain
    # config.middleware.use Apartment::Elevators::Subdomain
    config.load_defaults 5.2

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/assets/*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options, :head]
        # resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :patch, :options, :head]
      end
    end

    config.assets.paths << Rails.root.join("app", "vender", "assets", "fonts")

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
