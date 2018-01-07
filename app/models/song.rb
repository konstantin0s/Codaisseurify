class Song < ApplicationRecord

belongs_to :artist

 validates :title, presence: true
 # validates :genre, presence: true
 validates :artist, presence: true



 scope :order_by_name, -> { order(:name) }



end
