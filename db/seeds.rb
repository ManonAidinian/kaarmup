# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "json"
require "open-uri"

User.destroy_all
Charity.destroy_all
Company.destroy_all
Need.destroy_all

# ----------------- DUMMY DATAS -----------------

charity_user = User.create(email: "ma-cha@mail.com", password: "121212", first_name: "Mary Po", last_name: "Aidi", user_type: "Charity")
file = File.open(Rails.root.join("app/assets/images/marypo-avatar.jpg"))
charity_user.photo.attach(io: file, filename: "marypo-avatar.jpg", content_type: 'images/jpg')

charity1 = Charity.new(
  name: "Save Lola",
  location: "Bali",
  description: "Let's find a new family for Lola",
  user_id: charity_user.id
)
charity1.save!
file = File.open(Rails.root.join("app/assets/images/lola.jpg"))
charity1.photo.attach(io: file, filename: "lola.jpg", content_type: 'images/jpg')

need1 = Need.new(
  title: "Need a new family",
  karma_points: 37,
  category: "Animal rescue",
  charity_id: charity1.id
)
need1.save!

company_user = User.create(email: "ma-cie@mail.com", password: "121212",first_name: "Manon", last_name: "Aidinian", user_type: "Company")
file = File.open(Rails.root.join("app/assets/images/manon-avatar.jpg"))
company_user.photo.attach(io: file, filename: "manon-avatar.jpg", content_type: 'images/jpg')


# ----------------- CHARITIES SEEDING -----------------

url = "https://api.globalgiving.org/api/public/orgservice/all/organizations/active?api_key=41f6ec06-2b65-41a7-b0c2-c5f7e1e36924"
organizations_serialized = URI.open(url, "Accept" => "application/json", "Content_type" => "application/json").read
organizations = JSON.parse(organizations_serialized)

i = 0
10.times do
  user = User.new(email: Faker::Internet.email, password: "123123")
  user.save!
  charity = Charity.new(
  name: organizations["organizations"]["organization"][i]["name"],
  location: organizations["organizations"]["organization"][i]["city"],
  description: organizations["organizations"]["organization"][i]["mission"],
  user_id: user.id
  )
  charity.save!
  5.times do
    need = Need.new(
    title: Faker::Lorem.sentence(word_count: 3),
    karma_points: rand(1..50),
    category: organizations["organizations"]["organization"][i]["themes"]["theme"][0, 1].sample["name"],
    charity_id: charity.id
  )
  need.save!
  end
  i += 1
end

p User.count
p Charity.count
p Need.count
