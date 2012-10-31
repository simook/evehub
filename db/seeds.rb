# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'user' },
  { :name => 'member' }
], :without_protection => true)

user = User.create! :name => 'Blue Coeur', :email => 'simook@gmail.com', :password => 'password', :password_confirmation => 'password'
user.confirm!
user.add_role :admin
