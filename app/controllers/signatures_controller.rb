class SignaturesController < ApplicationController
  def create
    @petition = Petition.find(params[:petition_id])
    @signature = @petition.signatures.build(params[:signature])
    @signature.save

    respond_to do |format|
      format.html { redirect_to petition_url(@petition) }
    end
  end
end
