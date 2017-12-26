# app/uploaders/image_uploader.rb

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
