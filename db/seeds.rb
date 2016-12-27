# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

#Create test user
test = User.new(
  name: 'Test User',
  email: 'test@example.com',
  password: 'Michelle1!',
  role: 'admin',
  is_active: 'true'
  )

test.skip_confirmation!
test.save

test1 = User.new(
  name: 'Ivy',
  email: 'ivy@example.com',
  password: 'Michelle1!',
  role: 'admin',
  is_active: 'true'
  )

test1.skip_confirmation!
test1.save

test2 = User.new(
  name: 'jcc',
  email: 'jcc@example.com',
  password: 'Michelle1!',
  role: 'admin',
  is_active: 'true'
  )

test2.skip_confirmation!
test2.save

16.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'Michelle1!',
    role: 'admin',
    is_active: 'true'
    )
  user.skip_confirmation!
  user.save!
end

# time_slots = [ 
#   { start_time: 5, end_time: 9},
#   { start_time: 6, end_time: 10},
#   { start_time: 7, end_time: 11},
#   { start_time: 8, end_time: 12},
#   { start_time: 9, end_time: 13},
#   { start_time: 10, end_time: 14},
#   { start_time: 11, end_time: 15},
#   { start_time: 12, end_time: 16},
#   { start_time: 13, end_time: 17},
#   { start_time: 14, end_time: 18},
#   { start_time: 15, end_time: 19},
#   { start_time: 16, end_time: 20},
#   { start_time: 17, end_time: 21}
# ]

# time_slots.each do |time_slot|
#   WorkingHour.where(
#   start_time: time_slot[:start_time],
#   end_time: time_slot[:end_time]
#   ).first_or_create
# end
  
  
  #User.first
  #user = _
  #user.