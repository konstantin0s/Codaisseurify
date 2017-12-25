class SongsController < ApplicationController
  before_action :set_song, only: [:show]

  def index #will have template
  @song = Song.all
  end

  def show #will have template
  end

  def new #display the form
@song = Song.new
  end



  def edit #display for the existing song
  #will have template
  @song = Song.find(params[:id])
  end





  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find(params[:artist_id])
    if @song.save
      redirect_to @song.artist, notice: "Song added."
    else
      render 'new'
    end
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

def set_song
   @song = Song.find(params[:id])
 end

def song_params
  params
  .require(:song)
  .permit(:title, :genre, :artist_id)
end

end
