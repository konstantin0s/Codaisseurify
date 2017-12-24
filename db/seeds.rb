# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.destroy_all
Song.destroy_all


artist1 = Artist.create!(name: "Elvis Presley", image_url: "https://images-na.ssl-images-amazon.com/images/I/C1OaF6U9TDS._SL1000_.png")
artist2 = Artist.create!(name: "Lady Gaga", image_url:"https://pbs.twimg.com/profile_images/833109600660512772/ss9-ojz7.jpg")

artists_count = Artist.count
puts "#{artists_count} artists were created."


music1 = Song.create!( { name: "Livin la vida loca", genre: "latino", artist: artist1 } ),
music2 = Song.create!( { name: "Si senior", genre: "dance", artist: artist1 } ),
music3= Song.create!( { name: "Per tu amor", genre: "love", artist: artist2 } )



songs_count = Song.count
puts "#{songs_count} songs were created."
