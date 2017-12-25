class SongsController < ApplicationController

  def index #will have template
    #@artists = Artist.all
  end

  def show #will have template

  end

  def new #display the form

  end



  def edit #display for the existing song
  #will have template
  @song = Song.find(params[:id])
  end





  def create
    artist = Artist.find params[:artist_id]
        songs = artist.songs.new params[:song]
        song.save
        flash[:notice] = 'Song saved'
        redirect_to artist_path(artist)
end





def destroy
  song = Song.find(params[:id])
  @artist = song.artist
  if song.destroy
    redirect_to artist_path(@artist), notice: "SOng deleted."
  else
    redirect_to @artist, notice: "Try again to delete it."
  end
end

private

def song_params
  params
  .require(:song)
  .permit(:name)
end

end
