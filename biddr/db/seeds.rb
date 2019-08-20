# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NUM_AUCTIONS = 200
NUM_USERS = 10
PASSWORD = "supersecret"




Auction.delete_all
User.delete_all

super_user = User.create(
  f_name: "Jon",
  l_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD
)

NUM_USERS.times do
  f_name =  Faker::Name.first_name
  l_name = Faker::Name.last_name
  User.create(
    f_name: f_name,
    l_name: l_name,
    email: "#{f_name.downcase}.#{l_name.downcase}@example.com",
    password: PASSWORD
  )
end
users = User.all



NUM_AUCTIONS.times do
  created_at = Faker::Date.between(from: 20.days.ago, to: Date.today)
  later_date = Faker::Date.forward(days:3)
  q = Auction.create(
    # Faker is a ruby module. We access classes
    # or other modules inside of it with ::.
    # Here, Hacker is a class inside of the
    # Faker module
    title: Faker::Commerce.product_name,
    description: Faker::ChuckNorris.fact,
    auction_end: later_date,
    current_price: Faker::Commerce.price(range: 100..200.0, as_string: true),
    rsv_price: Faker::Commerce.price(range: 201..500.0, as_string: true),
    created_at: created_at,
    updated_at: created_at,
    user: users.sample
  )
  
end

auctions = Auction.all


p "Generated #{auctions.count} auctions"



p "Login with #{super_user.email} and password: #{PASSWORD}"