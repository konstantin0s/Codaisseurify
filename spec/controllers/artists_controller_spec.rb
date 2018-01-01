require 'spec_helper'
require 'rails_helper'


RSpec.describe ArtistsController, type: :controller do

    context 'GET #index' do
      it 'returns a success response' do
         get :index
         expect(response).to be_success #response.success?
       end
    end

    context 'GET #show' do
      it 'returns a success response' do

        artist = Artist.create!(name: "Super Karma", image_url: "https://images-na.ssl-images-amazon.com/images/I/C1OaF6U9TDS._SL1000_.png")
        get :show, params: { id: artist.to_param }
        expect(response).to be_success
      end
    end



end
