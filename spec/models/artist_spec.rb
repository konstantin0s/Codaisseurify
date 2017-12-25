require 'rails_helper'

RSpec.describe Artist, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      artist = Artist.new(name: 'Pavaroti').save
        end

    it 'ensures image_url presence' do
        end

    it 'should save successfully' do
        end
  end

  context 'scope tests' do

  end
end
