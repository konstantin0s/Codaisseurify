class ArtistsController < ApplicationController
 before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index #will have template
    @artists = Artist.all
    @artist = Artist.new
  end

def show #will have template
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
   @photos = @artist.photos
end

def new #display the form
  #will have template
  @artist = Artist.new
end

def create #save new song
  #will save and redirect
    @artist = Artist.new(allowed_params)

    if @artist.save
    add_photo
      redirect_to artists_path, notice: "You just made an artist."
    else
      render 'new'
    end
end

def edit #display for the existing song
  #will have template
  #@artist = Artist.find(params[:id])
  #@photos = @artist.photos
end

def update #save changes
  #will save and redirect
  #@artist = Artist.find(params[:id])
  if @artist.update(allowed_params)
  add_photo
    redirect_to artist_path
  else
    render 'new'
  end

end

def destroy
    if @artist.destroy
      redirect_to root_path, notice: "Artist deleted."
    else
      redirect_to @artist, notice: "Seems impossible to delete this artist."
    end
  end



private


def add_photo
    if !image_params.nil?
      @artist.photo.destroy unless @artist.photo.nil?
      @artist.photo = Photo.create(image: image_params)
    end
  end


def image_params
      params[:images].present? ? params.require(:images) : nil
    end

def set_artist
     @artist = Artist.find(params[:id])
   end

   #def set_songs
    # @songs = Artist.find(params[:artist_id]).songs
   #end

def allowed_params
    params.require(:artist).permit(:name, :image)

end


end
