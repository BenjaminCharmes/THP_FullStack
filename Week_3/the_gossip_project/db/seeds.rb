# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
JoinTableMessageRecipient.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(18..99), city_id: City.all.sample.id, password: "123456")
end

gossips = []

20.times do
  gossip = Gossip.create!(title: Faker::Name.first_name, content: Faker::Lorem.sentence(word_count: 15), user_id: User.all.sample.id)
  gossips << gossip
end

10.times do
  Tag.create!(title: Faker::Book.genre)
end

gossips.each do |gossip|
  JoinTableGossipTag.create!(gossip_id: gossip.id, tag_id: Tag.all.sample.id)
end

10.times do
  PrivateMessage.create!(content: Faker::Lorem.sentence(word_count: 10), sender_id: User.all.sample.id)
end

50.times do
  Comment.create!(content: Faker::Lorem.sentence(word_count: 10), user_id: User.all.sample.id, gossip_id: Gossip.all.sample.id)
end

User.create!(first_name: "Ano", last_name: "Nymous", description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(18..99), city_id: City.all.sample.id, password: "123456")
