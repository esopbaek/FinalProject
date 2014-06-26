# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago'  serving_size: "1 unit"}, { name: 'Copenhagen'  serving_size: "1 unit"}])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Food.create!({name: "pizza", calories: "200", serving_size: "1 unit"})
Food.create!({name: "sandwich", calories: "300", serving_size: "1 unit"})
Food.create!({name: "water", calories: "0", serving_size: "1 unit"})
Food.create!({name: "soup", calories: "100", serving_size: "1 unit"})
Food.create!({name: "vegetables", calories: "50", serving_size: "1 unit"})


