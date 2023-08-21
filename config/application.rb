require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TrackDirectory
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.exceptions_app = self.routes

    config.generators.system_tests = nil
    
    config.generators do |g|
      g.test_framework(
        :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
      )
    end
  end
end
