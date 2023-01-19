# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  City.create!(city_name: Faker::Address.city)
end

10.times do
  Dogsitter.create!(name: Faker::Name.name, city_id: rand(1..10))
end

50.times do
  Dog.create!(name: Faker::Creature::Dog.name, city_id: rand(1..10))
end

10.times do 
  Stroll.create!(dogsitter_id: rand(1..10))
end

100.times do
  StrollDog.create!(stroll_id: rand(1..10), dog_id: rand(1..50))
end