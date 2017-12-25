FactoryBot.define do
  factory :artist do
    name    { Faker::Name.name }
    image_url { Faker::Avatar.image } #=> "http://robohash.org/sitsequiquia.png?size=300x300" }
  end
end
