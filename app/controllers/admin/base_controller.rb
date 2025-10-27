# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout "admin"
    http_basic_authenticate_with name: "Admin", password: "Team11**"
  end
end
