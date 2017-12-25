class Song < ApplicationRecord

belongs_to :artist, optional: true

 validates :title, presence: true
 validates :genre, presence: true



 scope :order_by_name, -> { order(:name) }



end
