# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' },
  { :name => 'user' },
  { :name => 'member' }
], :without_protection => true)

puts 'CREATING PLANS'
Plan.create([
  { :name => 'test', :user_limit => '1'},
  { :name => 'basic', :user_limit => '10'},
  { :name => 'enyo', :user_limit => '20', :price => '20000000'},
  { :name => 'thorax', :user_limit => '30', :price => '30000000'},
  { :name => 'myrmidon', :user_limit => '40', :price => '40000000'},
  { :name => 'erebus', :user_limit => '100', :price => '50000000'}
], :without_protection => true)

