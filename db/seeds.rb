# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Food.create!({name: "pizza", calories: "200"})
Food.create!({name: "sandwich", calories: "300"})
Food.create!({name: "water", calories: "0"})
Food.create!({name: "soup", calories: "100"})
Food.create!({name: "vegetables", calories: "50"})


