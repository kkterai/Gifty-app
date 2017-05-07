# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  user = User.create(email: Faker::Internet.safe_email,
              username: Faker::Internet.user_name,
              password: Faker::Internet.password(10, 20))
              user.build_list(name: "My Wish List").save
  10.times do |item|
    user.list.items.create(name: Faker::Commerce.product_name)
    user.list.list_items.update(details: Faker::Hipster.paragraph)
  end
end
