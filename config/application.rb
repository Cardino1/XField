# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module XField
  class Application < Rails::Application
    config.load_defaults 7.1

    config.generators.system_tests = nil
    config.time_zone = "UTC"
    config.active_record.default_timezone = :utc
  end
end
