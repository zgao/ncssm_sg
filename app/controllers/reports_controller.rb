class ReportsController < ApplicationController
  before_filter :require_admin_login, only: [:new, :create, :destroy]
  before_filter :initialize_bill

  def new
    @report = @bill.reports.build
  end

  def create
    @report = @bill.reports.create(params[:report])

    if @report.save
      respond_to do |format|
        format.html { redirect_to bill_url(@bill) }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
      end
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])

    if (@report.update_attributes(params[:report]))
      respond_to do |format|
        format.html { redirect_to bill_report_url(@bill, @report) }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_bill_report_url(@bill, @report) }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])

    if @report.destroy
      respond_to do |format|
        format.html { redirect_to bill_url(@bill) }
      end
    else
      respond_to do |format|
        format.html { redirect_to bill_report_url(@bill, @report) }
      end
    end
  end

  private

  def initialize_bill
    @bill = Bill.find(params[:bill_id])
  end

  def require_admin_login
    unless admin_signed_in?
      redirect_to new_admin_session_url
    end
  end
end
