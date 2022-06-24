# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

User.destroy_all
Charity.destroy_all
Company.destroy_all
Need.destroy_all

user1 = User.create(email: "user1@gmail.com", password: "123123")
file = File.open(Rails.root.join("app/assets/images/manon-avatar.jpg"))
user1.photo.attach(io: file, filename: "manon-avatar.jpg", content_type: 'images/jpg')


10.times do
  user = User.new(email: Faker::Internet.email, password: "123123")
  user.save!
  charity = Charity.new(
  name: Faker::Name.name,
  location: Faker::Address.city,
  description: Faker::Lorem.paragraph(sentence_count: 2),
  user_id: user.id
  )
  charity.save!
  5.times do
    need = Need.new(
    title: Faker::Lorem.sentence(word_count: 3),
    karma_points: rand(1..50),
    category: Need::NEED_CATEGORIES.sample,
    charity_id: charity.id
  )
  need.save!
  end
end

p User.count
p Charity.count
p Need.count
