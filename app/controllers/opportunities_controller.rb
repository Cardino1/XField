# frozen_string_literal: true

class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.approved.order(created_at: :desc).group_by(&:opportunity_type)
  end

  def new
    @opportunity = Opportunity.new
  end

  def create
    @opportunity = Opportunity.new(opportunity_params)
    if @opportunity.save
      redirect_to opportunities_path, notice: "Thank you! Our team will review your submission shortly."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def opportunity_params
    params.require(:opportunity).permit(:opportunity_type, :title, :full_name, :organization, :description, :link)
  end
end
