class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist #, only: [:show, :edit, :update, :destroy]

  def index #will have template
  @song = Song.all
  end

  def show #will have template
    @song = Song.find(params[:id])
  end

  def new #display the form
    @song = Song.new
  end



  def edit #display for the existing song
  #will have template
  @song = Song.find(params[:id])
  end

def update
  @song = Song.find(params[:id])
  @song.update(song_params)
  redirect_to(artist_path(@song))
end



  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find(params[:artist_id])
    if @song.save
      redirect_to @song.artist, notice: "Song successfully added."
    else
      render 'new'
    end
  end



  def destroy
    #@artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(@artist.id), notice: "Song successfully deleted."
  end


    private


        def redirect_to_artist
          redirect_to artist_path(@artist.id)
        end


        def song_params
          params.require(:song).permit(:title, :genre, :artist_id)
        end

        def set_song
          @song = Song.find(params[:id])
        end



        def set_artist
          @artist = Artist.find(params[:artist_id])
        end


end
