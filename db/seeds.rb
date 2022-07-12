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
GoodAction.destroy_all

NEED_CATEGORIES = ["Food Donation", "Raw material", "School supplies", "Medical supplies", "Workforce", "IT Service", "Legal service", "Climate action", "Ecology", "Recycling", "Education", "Animal rescue", "Vehicule", "Premise/Room", "Textile", "Donation", "Household supplies", "Consulting", "Other"]

# ----------------- DUMMY DATAS -----------------

charity_user = User.create(email: "ma-cha@mail.com", password: "121212", first_name: "Mary Po", last_name: "Aidi", user_type: "Charity")
file = File.open(Rails.root.join("app/assets/images/marypo-avatar.jpg"))
charity_user.photo.attach(io: file, filename: "marypo-avatar.jpg", content_type: 'images/jpg')

charity1 = Charity.new(
  name: "Bungkus",
  location: "Bali",
  description: "We cook and distribute meals for the most in need",
  user_id: charity_user.id
)
charity1.save!
file = File.open(Rails.root.join("app/assets/images/nasi.jpg"))
charity1.photos.attach(io: file, filename: "nasi.jpg", content_type: 'images/jpg')

need1 = Need.new(
  title: "Raw food donation",
  karma_points: 18,
  category: "Food",
  charity_id: charity1.id
)
need1.save!

need2 = Need.new(
  title: "Kitchen supplies",
  karma_points: 5,
  category: "Supplies",
  charity_id: charity1.id
)
need2.save!

company_user = User.create(email: "ma-cie@mail.com", password: "121212",first_name: "Manon", last_name: "Aidinian", user_type: "Company")
file = File.open(Rails.root.join("app/assets/images/manon-avatar.jpg"))
company_user.photo.attach(io: file, filename: "manon-avatar.jpg", content_type: 'images/jpg')

company1 = Company.new(
  name: "Chez Mama",
  location: "Bali",
  description: "Family Restaurant with a big heart",
  user_id: company_user.id
)
company1.save!
file = File.open(Rails.root.join("app/assets/images/chezmama.jpg"))
company1.photos.attach(io: file, filename: "chezmama.jpg", content_type: 'images/jpg')



# ----------------- CHARITIES SEEDING -----------------

url = "https://api.globalgiving.org/api/public/orgservice/all/organizations/active?api_key=41f6ec06-2b65-41a7-b0c2-c5f7e1e36924"
organizations_serialized = URI.open(url, "Accept" => "application/json", "Content_type" => "application/json").read
organizations = JSON.parse(organizations_serialized)

i = 0
10.times do
  user = User.new(email: Faker::Internet.email,
                  password: "123123",
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  user_type: "Charity"
                )
  user.save!
  charity = Charity.new(
  name: organizations["organizations"]["organization"][i]["name"],
  location: organizations["organizations"]["organization"][i]["city"],
  description: organizations["organizations"]["organization"][i]["mission"],
  user_id: user.id
  )
  charity.save!
  charity_pic = URI.open("https://source.unsplash.com/random/?charity=#{rand(1..10)}")
  charity.photos.attach(io: charity_pic, filename: "#{charity.name}_#{charity.id}.jpg", content_type: 'images/jpg')

  5.times do
    need = Need.new(
    title: "We need " + NEED_CATEGORIES.sample,
    karma_points: rand(1..50),
    category: NEED_CATEGORIES.sample,
    charity_id: charity.id,
    description:Faker::Lorem.sentence(word_count: 10)
  )
  need.save!
  end
  i += 1
end

p User.count
p Charity.count
p Need.count
