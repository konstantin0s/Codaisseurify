class Song < ApplicationRecord

belongs_to :artist, optional: true

 #validates :name, presence: true
 #validates :name, uniqueness: true

 #validates :image_url, length: { maximum: 255 }, allow_blank: true

 scope :order_by_name, -> { order(:name) }



end
