class Photo < ApplicationRecord
belongs_to :artist, :dependent => :destroy

mount_uploader :image, ImageUploader
end
