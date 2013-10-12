class EmailsController < ApplicationController
  def index
  end

  def submit
    AdminMailer.contact_us_email("Message from #{params[:name]} on #{params[:hall]}", params[:message]).deliver

    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email successfully delivered' }
    end
  end
end
