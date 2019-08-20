require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Biddr
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.middleware.insert_before(0, Rack::Cors) do
      allow do
        # origins specifies which domains are allowed to make AJAX requests
        # to this server
        origins("localhost:3001", "127.0.0.1:8080", "127.0.0.1:5500")

         resource(
          # allow access to only paths that begin with /api/
          "/api/*",
          # this allows all HTTP headers to be sent
          Access-Control-Allow-Origin: *,
          headers: :any,
          # Allows sharing of cookies for CORS requests made to this resource
          credentials: true,
          # define the HTTP verbs which are allowed in a request
          methods: [:get, :post, :delete, :patch, :put, :options]
        )
      end
    end
  end
end
