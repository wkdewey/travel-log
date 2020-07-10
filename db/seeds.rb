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
  country = Country.create(name: place_country)
  country_id = country.id
  city = City.create(name: place_city, country_id: country_id)
  city_id = city.id
  binding.pry
  Place.create(name: place_name, city_id: city_id)
  User.create(name: user_name, hometown: user_hometown, password: user_password)
  UserPlace.create(user_id: user_id, place_id: place_id)
end