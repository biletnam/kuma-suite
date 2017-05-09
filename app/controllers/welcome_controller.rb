class WelcomeController < ApplicationController
  before_action :already_signed_in?

  def index
    @user = User.new
  end

  private

  def already_signed_in?
    redirect_to dashboard_index_path if user_signed_in?
  end


  #  after user type has been defined use this
  # def already_signed_in?
  #   if user_signed_in? && current_user.user_type == ‘Agent’
  #     redirect_to dashboard_index_path
  #   end
  # end


end
