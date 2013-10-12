class BillsController < ApplicationController
  before_filter :require_admin_login, only: [:new, :create, :edit, :update, :destroy]

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(params[:bill])

    if @bill.save
      respond_to do |format|
        format.html { redirect_to @bill }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url }
      end
    end
  end

  def index
    @bills = Bill.all
  end

  def show
    @bill = Bill.find(params[:id])
    @report = Report.new bill: @bill

    respond_to do |format|
      format.html
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    if (@bill.update_attributes(params[:bill]))
      respond_to do |format|
        format.html { redirect_to bill_url(@bill) }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_bill_url(@bill) }
      end
    end
  end

  def destroy
    @bill = Bill.find(params[:id])

    if @bill.destroy
      respond_to do |format|
        format.html { redirect_to bills_url }
      end
    else
      respond_to do |format|
        format.html { redirect_to bill_url(@bill) }
      end
    end
  end

  private

  def require_admin_login
    unless admin_signed_in?
      redirect_to new_admin_session_url
    end
  end
end
