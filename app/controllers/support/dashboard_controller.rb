class Support::DashboardController < ApplicationController
  class SupportController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_client?

    def index
      @last_ticket = Ticket.last
      @ticket = Ticket.new
      @tickets = Ticket.all
      @ticket.user = current_user
    end

    private

    def user_is_client?
      unless current_user.is_client?
        redirect_to root_path, notice: 'Welcome back'
      end
    end

    def find_ticket
      @ticket = Ticket.find params[:id]
    end

    def ticket_params
      params.require(:ticket).permit([:title, :body, :department_id, :user])
    end

  end

end
