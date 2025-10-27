# frozen_string_literal: true

module Admin
  class DashboardController < BaseController
    def index
      @articles_count = Article.count
      @opportunities_pending = Opportunity.pending.count
      @investors_pending = Investor.pending.count
      @users_count = User.count
    end
  end
end
