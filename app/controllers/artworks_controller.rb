require 'byebug'

class ArtworksController < ApplicationController
  def index
    render json: User.get_artwork(params[:user_id])
  end

  def show
    @artwork = Artwork.find(params[:id])
    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork
      @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  def create
    @artwork = Artwork.create(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork
      @artwork.delete
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end
  end

  private
  def artwork_params
    params[:artwork].permit(:title, :image_url, :artist_id)
  end


end
