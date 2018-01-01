class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_artist #, only: [:show, :edit, :update, :destroy]


  def index #will have template
    @song = Song.all
  end

  def show #will have template
    @artist = set_artist
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




#def create
#  @song = Song.new(song_params)
#  @song.artist = @artist
#  if @song.save
#   redirect_to @song.artist, notice: "Song successfully added."
#  else
#    @songs = Song.all
#    respond_to do |format|
#  format.html { render 'new' }
#  format.js
#  end
#end
#end

  def create
     @artist = Artist.find(params[:artist_id])
    @song = Song.new(song_params)
    @song.artist = @artist
    if @song.valid?
      @song.save
         respond_to do |format|
         format.html { redirect_to artist_path(@artist), notice: "Song added." }
         format.json { render json: @song }
       end
       else
      render :new
     end
   end




  def destroy
    #@artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy

    respond_to do |format|
        format.html { redirect_to artist_path(@artist), notice: "Song successfully deleted." }
        format.json { render json: @artist }
      end
   end


    private


        #def redirect_to_artist
        #  redirect_to artist_path(@artist.id)
        #end


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
