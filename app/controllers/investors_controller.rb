# frozen_string_literal: true

class InvestorsController < ApplicationController
  def index
    @investors = Investor.approved.order(created_at: :desc)
  end

  def new
    @investor = Investor.new
  end

  def create
    @investor = Investor.new(investor_params)
    if @investor.save
      redirect_to investors_path, notice: "Thank you! Our team will contact you after reviewing your submission."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def investor_params
    params.require(:investor).permit(:firm_name, :contact_name, :email, :values, :looking_for, :portfolio_highlights, :request_for_startups, :website)
  end
end
