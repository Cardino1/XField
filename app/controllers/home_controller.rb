# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @latest_articles = Article.order(published_on: :desc).limit(3)
    @featured_opportunities = Opportunity.approved.order(created_at: :desc).limit(6)
    @investors = Investor.approved.limit(6)
    @updates_user = User.new
  end
end
