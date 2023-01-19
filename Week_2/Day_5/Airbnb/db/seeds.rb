# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

City.destroy_all
User.destroy_all
Listing.destroy_all
Reservation.destroy_all

10.times do
  City.create!(name: Faker::Address.city, zip_code: '%05d' % rand(01000..99999))
end

20.times do |pn|
  User.create!(email: Faker::Internet.email, phone_number: "+336" + '%08d' % rand(0..99999999), description: Faker::Lorem.sentence(word_count: 10))
end

50.times do
  Listing.create!(available_beds: rand(1..3), price: rand(50..999), description: Faker::Lorem.sentence(word_count: 140), has_wifi: [true, false].sample, welcome_message: Faker::Lorem.sentence(word_count: 10), admin_id: User.all.sample.id, city_id: City.all.sample.id)
end

startdates_past = []
5.times do |time|
  startdates_past << Faker::Time.between(from: DateTime.now - (time * 30), to: DateTime.now, format: :default).to_datetime
end

startdates_past.each do |startdate|
  Reservation.create!(start_date: startdate, end_date: startdate + rand(1..14), guest_id: User.all.sample.id, listing_id: Listing.all.sample.id)
end

startdates_future = []
5.times do |time|
  startdates_future << Faker::Time.between(from: DateTime.now, to: DateTime.now + (time * 30), format: :default).to_datetime
end

startdates_future.each do |startdate|
  Reservation.create!(start_date: startdate, end_date: startdate + rand(1..14), guest_id: User.all.sample.id, listing_id: Listing.all.sample.id)
end