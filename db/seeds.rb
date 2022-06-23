# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

Charity.destroy_all
Company.destroy_all
Need.destroy_all

company = Company.new(email: "co@mail.com", password: "123123", name: "Company.ltd", location: Faker::Address.city)

10.times do
  charity = Charity.new(
  name: Faker::Name.name,
  location: Faker::Address.city,
  description: Faker::Lorem.paragraph(sentence_count: 2)
  )
  charity.save!
  5.times do
    need = Need.new(
    title: Faker::Lorem.sentence(word_count: 3),
    karma_points: rand(1..50),
    category: Need::CATEGORY.sample,
    charity_id: charity.id
  )
  need.save!
  end
end

p Charity.count
p Need.count
