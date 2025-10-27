# frozen_string_literal: true

Rails.application.config.permissions_policy do |policy|
  policy.geolocation :none
  policy.camera :none
  policy.microphone :none
end
