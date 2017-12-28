class PhotosController < ApplicationController
#before_action :set_artist, only: [:show, :edit, :update, :destroy]
#before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def destroy
      photo = Photo.find(params[:id])
      @artist = photo.artist
      if photo.destroy
        redirect_to artist_path(@artist), notice: "Photo deleted."
      else
        redirect_to @artist, notice: "Your photo is not deleted."
      end
    end

    private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def image_params
          params[:images].present? ? params.require(:images) : []
        end

        def set_photo
          @photo = Photo.find(params[:id])
        end


end
