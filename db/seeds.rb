# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.where(email: 'arsemchik@gmail.com').first
user.destroy

user = User.new

user.email = 'arsemchik@gmail.com'
user.password = '07130713'
user.admin = true
user.save!
