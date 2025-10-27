# frozen_string_literal: true

class UpdatesController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: "Thanks for subscribing!" }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, alert: @user.errors.full_messages.to_sentence }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("updates_form", partial: "shared/update_form", locals: { user: @user }) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
