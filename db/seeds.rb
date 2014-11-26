# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({
  email: "example@bitmakerlabs.com",
  name: "Example User",
  password: "pass",
  password_confirmation: "pass"
  }
)

100.times do |i|

Product.create({
  name: "Product#{i}",
  description: "Description#{i}",
  url: "http://insolitebuzz.fr/wp-content/uploads/2014/10/test-all-the-things.jpg",
  price_in_cents: i 
  }
)
end