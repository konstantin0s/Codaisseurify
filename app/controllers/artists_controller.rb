class ArtistsController < ApplicationController


  def index #will have template
    @artists = Artist.all
  end

def show #will have template
  @artist = Artist.find(params[:id])
end

def new #display the form
  #will have template
  @artist = Artist.new
end

def create #save new song
  #will save and redirect
    @artist = Artist.new(allowed_params)

    if @artist.save
      redirect_to artists_path
    else
      render 'new'
    end
end

def edit #display for the existing song
  #will have template
  @artist = Artist.find(params[:id])
end

def update #save changes
  #will save and redirect
  @artist = Artist.find(params[:id])
  if @artist.update_attributes(allowed_params)
    redirect_to artists_path
  else
    render 'new'
  end

end

def destroy
  #will destroy and redirect
end

private

def allowed_params
    params.require(:artist).permit(:name, :image_url)
end


end
