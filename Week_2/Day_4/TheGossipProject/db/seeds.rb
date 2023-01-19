# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(18..99), city_id: rand(1..10))
end

gossips = []

20.times do
  gossip = Gossip.create!(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 15), user_id: rand(1..10))
  gossips << gossip
end

10.times do
  Tag.create!(title: Faker::Book.genre)
end

gossips.each do |gossip|
  GossipTag.create!(gossip_id: gossip.id, tag_id: rand(1..10))
end

10.times do
  PrivateMessage.create!(content: Faker::Lorem.sentence(word_count: 10), sender_id: rand(1..10))
end

20.times do
  Recipient.create!(recipient_id: rand(1..10), private_message_id: rand(1..10))
end

20.times do
  Comment.create!(content: Faker::Lorem.sentence(word_count: 10), gossip_id: rand(1..20), user_id: rand(1..10))
end

10.times do
  GossipLike.create!(user_id: rand(1..10), gossip_id: rand(1..20))
end

10.times do
  CommentLike.create!(user_id: rand(1..10), comment_id: rand(1..20))
end