# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

80.times do |idx|
  user = User.new
  user.name = "John D#{idx}"
  user.email = "johnd#{idx}@gmail.com"
  user.password = "secret123"
  user.save!
end