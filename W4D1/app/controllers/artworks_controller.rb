class ArtworksController < ApplicationController
  def index
    render json: Artwork.all
  end


  def create
    @artwork = Artwork.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end


  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.destroy
      render json: @artwork
    else
      render text: "Artwork not found"
    end
  end

  private

    def user_params
      params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
