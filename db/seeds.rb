# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 80.times do |idx|
#   user = User.new
#   user.name = "John D#{idx}"
#   user.email = "johnd#{idx}@gmail.com"
#   user.password = "secret123"
#   user.save!
# end

user1 = User.new
user1.name = "Star Helios"
user1.email = "starhelios94@gmail.com"
user1.password = "simplero"
user1.save!

user2 = User.new
user2.name = "Calvin"
user2.email = "calvin@simplero.com"
user2.password = "simplero"
user2.save!

user3 = User.new
user3.name = "Owais"
user3.email = "owais@simplero.com"
user3.password = "simplero"
user3.save!
