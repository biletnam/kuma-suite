class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new ticket_params
    @ticket.user = current_user

    if @ticket.save
      redirect_to ticket_path(@ticket)
      flash[:notice] = 'Ticket posted successfully'
      # , notice: 'Ticket successfully posted'
    else
      render :new
      # render 'support/tickets/show'
      flash[:alert] = 'Ticket not created'
    end
  end

  def show
    # comment_params = params.require(:comment).permit(:body)
    @ticket = Ticket.find params[:id]
    @tickets = Ticket.last(20)
    @comment = Comment.new
    # comment_params
  end

  def index
    @tickets = Ticket.last(20)
    # @tags = Tag.all
  end

  def edit
    redirect_to root_path, alert: 'Access denied!' unless can? :edit, @ticket
    @ticket = Ticket.find params[:id]
  end

  def update
    @ticket = Ticket.find params[:id]
    # ticket_params = params.require(:ticket).permit([:title, :body, :department ])

    if !(can? :edit, @ticket)
      redirect_to root_path, alert: 'access denied'
    elsif @ticket.update(ticket_params)
      redirect_to ticket_path(@ticket), notice: 'Ticket updated'
    end
  end

  def destroy
    ticket = Ticket.find params[:id]
    # ticket.destroy
    if can? :destroy, @ticket
      @ticket.destroy
      redirect_to tickets_path, notice: 'Ticket Deleted'
    end
  end

  private
  def find_ticket
    @ticket = Ticket.find params[:id]
  end

  def ticket_params
    params.require(:ticket).permit([:title, :body, :department_id, :user])
  end

end
