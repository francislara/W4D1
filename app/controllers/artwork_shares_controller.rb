class ArtworkSharesController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    if @artwork_share
      @artwork_share.delete
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: 404
    end
  end

  private

  def artwork_share_params
    params[:artwork_share].permit(:viewer_id, :artwork_id)
  end
end
