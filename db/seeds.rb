# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Create Users
  5.times do
    user = User.new(
    email:    Faker::Internet.email,
    username: Faker::Name.first_name,
    password: 'password'
    )
    user.skip_confirmation!
    user.save!
  end

  # Create an admin user
  admin = User.new(
    username:   'Admin User',
    email:      'admin@example.com',
    password:   'helloworld',
    role:       'Admin'
    )
  admin.skip_confirmation!
  admin.save!

  # Create a premium user
  premium = User.new(
    username:   'Premium User',
    email:      'premium@example.com',
    password:   'helloworld',
    role:       'Premium'
    )
  premium.skip_confirmation!
  premium.save!

  # Create member user
  member = User.new(
    username:   'Member User',
    email:      'member@example.com',
    password:   'helloworld',
    )
  member.skip_confirmation!
  member.save!

  users = User.all

  # Create Wikis
  10.times do
    wiki = Wiki.create!(
      user:     users.sample,
      title:    Faker::Lorem.word,
      body:     Faker::Lorem.paragraph,
      private:  false
    )
  end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
