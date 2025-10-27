# frozen_string_literal: true

module Admin
  class InvestorsController < BaseController
    before_action :set_investor, only: %i[show edit update destroy approve reject]

    def index
      @investors = Investor.order(created_at: :desc)
    end

    def show; end

    def new
      @investor = Investor.new
    end

    def edit; end

    def create
      @investor = Investor.new(investor_params.merge(approved: true))
      if @investor.save
        redirect_to admin_investor_path(@investor), notice: "Investor profile was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @investor.update(investor_params)
        redirect_to admin_investor_path(@investor), notice: "Investor profile was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @investor.destroy
      redirect_to admin_investors_path, notice: "Investor profile was removed."
    end

    def approve
      @investor.update(approved: true)
      redirect_to admin_investors_path, notice: "Investor profile approved."
    end

    def reject
      @investor.update(approved: false)
      redirect_to admin_investors_path, notice: "Investor profile marked as pending."
    end

    private

    def set_investor
      @investor = Investor.find(params[:id])
    end

    def investor_params
      params.require(:investor).permit(:firm_name, :contact_name, :email, :values, :looking_for, :portfolio_highlights, :request_for_startups, :website, :approved)
    end
  end
end
