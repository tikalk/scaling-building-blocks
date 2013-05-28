# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'

user1 = User.create! :email => 'val.hoffman@gmail.com', :password => 'asdf1234', :password_confirmation => 'asdf1234'
puts 'New admin user created: ' << user1.email
user1.add_role :admin
user1.save!

user2 = User.create! :email => 'vhof@gmail.com', :password => 'asdf1234', :password_confirmation => 'asdf1234'
puts 'New user created: ' << user2.email
