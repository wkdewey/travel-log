require "faker"

10.times do
  user_name = Faker::Name.name
  user_place = Faker::Address.city
  user_password = Faker::Alphanumeric.alphanumeric(number: 10)
  place_name = Faker::Address.community
  place_city = Address.city
  place_country = Address.country
end