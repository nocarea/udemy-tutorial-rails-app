# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts
5.times{print "~"}
puts "Creating Admin Account:"
puts "Email: example@exam.ple"
puts "Password: 12345678"
User.new(username: "exampledude", email: "example@exam.ple", password: "12345678").save
puts

39.times do
    username = Faker::Name.unique.first_name
    email = "#{username}@#{Faker::Color.color_name}.com"
    User.new(username: username, email: email, password: rand(11111111..99999999).to_s).save
end
5.times{print "~"}
puts "Created #{User.all.count} example users..."

125.times do
    Article.new(title: Faker::Book.title, description: Faker::Lorem.sentence(word_count: 25), user_id: rand(1..(User.all.count))).save
end
5.times{print "~"}
puts "Created #{Article.all.count} example Articles..."

