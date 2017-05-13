class SupportController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_client?

  def index
    @ticket = Ticket.new
  end

  def create

  end

  def destroy

  end

  private

  def user_is_client?
    unless current_user.is_client?
      redirect_to root_path, notice: 'Welcome back'
    end
  end

end
