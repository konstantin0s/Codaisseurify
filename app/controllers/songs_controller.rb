class SongsController < ApplicationController

  def index #will have template
    @songs = Song.all
  end

def show #will have template
  @song = Song.find(params[:id])
end

def new #display the form
  #will have template
  @song = Song.new
end

def create #save new song
  #will save and redirect
    @song = Song.new(allowed_params)

    if @song.save
      redirect_to songs_path
    else
      render 'new'
    end
end

def edit #display for the existing song
  #will have template
  @song = Song.find(params[:id])
end

def update #save changes
  #will save and redirect
  @song = Song.find(params[:id])
  if @song.update_attributes(allowed_params)
    redirect_to songs_path
  else
    render 'new'
  end

end

def destroy
  #will destroy and redirect
end

private

def allowed_params
    params.require(:song).permit(:name, :genre)
end

end
