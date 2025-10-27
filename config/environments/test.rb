# frozen_string_literal: true

require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    "Cache-Control" => "public, max-age=3600"
  }

  config.active_support.cache_format_version = 7.0
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false

  config.active_record.maintain_test_schema = true
end
