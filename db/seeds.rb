require "faker"

10.times do
  user_name = Faker::Name.name
  user_hometown = Faker::Address.city
  user_password = Faker::Alphanumeric.alphanumeric(number: 10)
  place_name = Faker::Address.community
  place_city = Faker::Address.city
  place_country = Faker::Address.country
  place_user_id = rand(1..10)
  User.create(name: user_name, hometown: user_hometown, password: user_password)
  Place.create(name: place_name, city: place_city, country: place_country, user_id: place_user_id)
end