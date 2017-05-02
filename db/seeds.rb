# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  User.create(email: Faker::Internet.safe_email,
              username: Faker::Internet.user_name,
              password: Faker::Internet.password(10, 20))
end

User.all.each do |user|
  1.times do
    user.build_list(name: "My Wish List").save
  end
end

10.times do
  Item.create(name: Faker::Commerce.product_name)
end
