class PetitionsController < ApplicationController
  before_filter :require_admin_login, only: [:destroy]

  def index
    @petitions = Petition.all

    respond_to do |format|
      format.html
      format.json { render @petitions }
    end
  end

  def show
    @petition = Petition.find(params[:id])
    @signature = Signature.new petition: @petition

    respond_to do |format|
      format.html
      format.json { render @petition }
    end
  end

  def new
    @petition = Petition.new

    respond_to do |format|
      format.html
      format.json { render @petition }
    end
  end

  def create
    @petition = Petition.create(params[:petition])
    signature = @petition.signatures.create name: params[:name], hall: params[:hall]

    if @petition.save
      signature.save!
      respond_to do |format|
        format.html { redirect_to petition_url(@petition) }
        format.json { render @petition }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def update
    @petition = Petition.find(params[:id])

    if @petition.update_attributes(params[:petition])
      respond_to do |format|
        format.html { redirect_to petition_url(@petition) }
        format.json { render @petition }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def require_admin_login
    unless admin_signed_in?
      redirect_to new_admin_session_url
    end
  end
end
