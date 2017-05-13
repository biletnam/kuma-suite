class PassthroughController < ApplicationController
  def index
    if current_user.is_staff
      redirect_to 'dashboard/index'
    elsif current_user.is_client
      redirect_to 'support/index'
    else
      redirect_to 'welcome/index'
    end
  end
end
