require "faker"

10.times do |i|
  user_name = Faker::Name.name
  user_hometown = Faker::Address.city
  user_password = Faker::Alphanumeric.alphanumeric(number: 10)
  place_name = Faker::Address.community
  place_city = Faker::Address.city
  place_country = Faker::Address.country
  place_id = i + 1
  user_id = rand(1..10)
  User.create(name: user_name, hometown: user_hometown, password: user_password)
  Place.create(name: place_name, city: place_city, country: place_country)
  UserPlace.create(user_id: user_id, place_id: place_id)
end