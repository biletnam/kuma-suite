class WelcomeController < ApplicationController
  before_action :already_signed_in?

  def index
    @user = User.new
  end

  private

  def already_signed_in?
    redirect_to dashboard_index_path if user_signed_in?
  end

  def already_signed_in?
    if user_signed_in? && current_user.is_staff?
      redirect_to dashboard_index_path
    # elsif user_signed_in? && current_user.is_client?
  # else
  #     render root_path,
  #     flash[:notice] = 'current user is client'
  #   else
  #     render :welcome,
  #     flash[:notice] = 'welcome else error'
    end
  end
end
