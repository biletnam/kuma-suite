class DashboardController < ApplicationController
  # before_filter :authenticate_user!
  before_action :authenticate_user!

  def index
  end
end
