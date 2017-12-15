require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_controller.include_all_helpers = true
    config.action_mailer.default_options = { from: "no-reply@cur1osity.com" }
    # Include the authenticity token in remote forms.
	config.action_view.embed_authenticity_token_in_remote_forms = true

   # config.middleware.insert_before 0, Rack::Cors do
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins 'localhost:3000'
        resource '*', headers: :any, methods: [
          :get, :post, :put, :patch, :delete, :options, :head
        ]
      end
    end

    config.middleware.use Rack::Attack
  end
end