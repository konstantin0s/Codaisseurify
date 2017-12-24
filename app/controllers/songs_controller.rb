class SongsController < ApplicationController

  def create
  @artist = Artist.find(params[:artist_pathid])
  @song = Song.new(song_params)
  @song.artist_id = params[:artist_id]
  @song.save
  redirect_to artist_path(@artist), notice: "Song added."
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
