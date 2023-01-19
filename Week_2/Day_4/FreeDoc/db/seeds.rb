# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  City.create!(name: Faker::Address.city)
end

specialty = ["General practitioner", "Ophthalmologist", "Surgeon", "Physiotherapist", "Radiologist"]
specialty.each do |specialty|
  Specialty.create!(specialty: specialty)
end

10.times do
  Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: rand(1..10))
end

20.times do
  DoctorSpecialty.create!(doctor_id: rand(1..10), specialty_id: rand(1..5))
end

50.times do
  Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: rand(1..10))
end

100.times do
  Appointment.create!(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :default), doctor_id: rand(1..10) , patient_id: rand(1..50), city_id: rand(1..10))
end

