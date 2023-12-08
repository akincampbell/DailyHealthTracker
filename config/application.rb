require_relative "boot"

require "rails/all"

# TODO: Keep?
# require 'gruff'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework nil
      g.factory_bot false
      g.scaffold_stylesheet false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.action_controller.default_protect_from_forgery = false
    config.generators.system_tests = nil

    OpenAI.configure do |config|
      config.api_type = ENV['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']
    end
  end
end
