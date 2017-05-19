  class InvoicesController < ApplicationController
    before_action :authenticate_user!
    before_action :user_is_staff?

    before_action :find_invoice, only: [:show, :edit, :update, :destroy]

    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new invoice_params
      @invoice.user = current_user

      if @invoice.save
        redirect_to invoice_path(@invoice)
        flash[:notice] = 'Invoice posted successfully'
        # , notice: 'Invoice successfully posted'
      else
        render :new
        # render 'support/invoices/show'
        flash[:alert] = 'Invoice not created'
      end
    end

    def show
      # comment_params = params.require(:comment).permit(:body)
      @invoice = Invoice.find params[:id]
      @invoices = Invoice.last(20)
      @comment = Comment.new
      # comment_params
    end

    def index
      @invoices = Invoice.last(20)
      @staff = User.all.where(is_staff: true)
      # @tags = Tag.all
    end

    def edit
      redirect_to root_path, alert: 'Access denied!' unless can? :edit, @invoice
      @invoice = Invoice.find params[:id]
    end

    def update
      @invoice = Invoice.find params[:id]
      # invoice_params = params.require(:invoice).permit([:title, :body, :department ])

      if !(can? :edit, @invoice)
        redirect_to root_path, alert: 'access denied'
      elsif @invoice.update(invoice_params)
        redirect_to invoice_path(@invoice), notice: 'Invoice updated'
      end
    end

    def destroy
      invoice = Invoice.find params[:id]
      # invoice.destroy
      if can? :destroy, @invoice
        @invoice.destroy
        redirect_to invoices_path, notice: 'Invoice Deleted'
      end
    end

    private

    def user_is_staff?
      unless current_user.is_staff?
        redirect_to root_path, alert: 'Unauthorized access'
      end
    end

    def find_invoice
      @invoice = Invoice.find params[:id]
    end

    def invoice_params
      params.require(:invoice).permit([:title, :body, :department_id, :user])
    end

    end
