class PhotosController < ApplicationController
before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def destroy
      photo = Photo.find(params[:id])
      @artist = photo.artist
      if photo.destroy
        redirect_to artist_path(@artist), notice: "Photo removed"
      else
        redirect_to @artist, notice: "Cannot delete that photo"
      end
    end

    private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end



end
