FactoryBot.define do
  factory :song do
       title  { Faker::Name.title }
      genre   { Faker::Genre.genre }

  end
end
