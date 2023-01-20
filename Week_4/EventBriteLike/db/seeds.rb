# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Event.destroy_all

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, password: "123456")
end

10.times do
  Event.create!(start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :default).to_datetime, duration: 60, title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 20),price: rand(1..1000), location: Faker::TvShows::GameOfThrones.city, admin_id: User.all.sample.id)
end