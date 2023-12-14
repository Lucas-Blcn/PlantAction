require 'open-uri'

puts "1- Cleaning DataBase"
Booking.destroy_all
Plant.destroy_all
User.destroy_all

puts "2- Creating 2 Users"

user1 = User.create!(
  email: "lewagon@certif.test",
  password: "azertyuiop",
  first_name: "lucas",
  last_name: "blcn"
)

user2 = User.create!(
  email: "letest@pourcertif.test",
  password: "azertyuiop",
  first_name: "Benoit",
  last_name: "Ncbl"
)

puts "2- Nb Users: #{User.count}"

puts "3- Creating products"

categories = %w[grasse feuillue piquante ligneux herbacee vivace]

file_plant1 = URI.open("https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fHBsYW50fGVufDB8fDB8fHww")
file_plant2 = URI.open("https://images.unsplash.com/photo-1453904300235-0f2f60b15b5d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fHBsYW50fGVufDB8fDB8fHww")

plant1 = Plant.create!(
  category: categories[rand(0..5)],
  price: rand(5..35),
  title: Faker::Movie.title,
  user_id: user1.id
)
plant1.photos.attach(io: file_plant1, filename: "nes.png", content_type: "image/png")

plant2 = Plant.create!(
  category: categories[rand(0..5)],
  price: rand(5..35),
  title: Faker::Movie.title,
  user_id: user2.id
)
plant2.photos.attach(io: file_plant2, filename: "nes.png", content_type: "image/png")
