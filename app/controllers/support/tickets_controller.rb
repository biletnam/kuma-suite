class Support::TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_is_client?

  def index
    @user = current_user

    @ticket = Ticket.new
    @tickets = current_user.tickets params[:id]
    @ticket.user = current_user
  end

  def show
    @ticket = Ticket.find params[:id]
    @tickets = Ticket.last(20)
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user

    if @ticket.save
      flash[:notice] = 'Ticket posted successfully'
      redirect_to support_ticket_path(@ticket)
    else
      flash[:alert] = 'Ticket not created'
      render :index
    end
  end

  def edit
    # redirect_to root_path, alert: 'Access denied!' unless can? :edit, @ticket
    # @ticket = Ticket.find params[:id]
  end

  def destroy
    ticket = Ticket.find params[:id]
    if can? :destroy, @ticket
      @ticket.destroy
      redirect_to support_tickets_path, notice: 'Ticket Deleted'
    else
      redirect_to root_path, alert: 'Access denied'
    end
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
