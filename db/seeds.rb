# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'

user1 = User.create! :email => 'avit@tikalk.com', :password => '1q2w3e4r', :password_confirmation => '1q2w3e4r'
puts 'New admin user created: ' << user1.email
user1.add_role :admin
user1.save!

user2 = User.create! :email => 'vhof@gmail.com', :password => 'asdf1234', :password_confirmation => 'asdf1234'
puts 'New user created: ' << user2.email

users = []

10.times do
  users << User.create(email: Faker::Internet.email, 
                       password: 'foobar1234', 
                       password_confirmation: 'foobar1234', 
                       full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}")
end

500.times do |index|
  puts "Creating product: #{index}"
  product = Product.create(name: Faker::Company.name,
                            description: Faker::Lorem.paragraph(3),
                            serves: [*1..5].sample,
                            price: [*25..322].sample,
                            image: "carousel-0#{[*1..3].sample}.jpg")

  puts "Creating product #{index} likes."
  [*2..10].sample.times do
    product.likes << Like.create(likeability: [*1..5].sample, user_id: users.sample.id)
  end

  puts "Creating product #{index} reviews."
  [*2..10].sample.times do
    product.reviews << Review.create(description: Faker::Lorem.sentence, user_id: users.sample.id)
  end
end
