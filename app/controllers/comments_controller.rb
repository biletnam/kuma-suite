class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def index
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.new(comment_params)
    @comment.ticket = @ticket
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to ticket_path(@ticket), notice: 'Comment Created!' }
        format.js   { render :success }
      else
        format.html { render '/tickets/show' }
        format.js   { render :failure }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to ticket_path(comment.ticket), notice: "Comment deleted!" }
      format.js { render }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user)
  end
end
