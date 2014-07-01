# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago'  serving_size: "1 unit"}, { name: 'Copenhagen'  serving_size: "1 unit"}])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Food.create!({name: "pizza", calories: "200", serving_size: "1 unit", carbs: "80", protein: "20", total_fat: "20", sodium: "500", sugar: "2"})
Food.create!({name: "sandwich", calories: "300", serving_size: "1 unit", carbs: "40", protein: "15", total_fat: "10", sodium: "500", sugar: "7"})
Food.create!({name: "water", calories: "0", serving_size: "1 unit"})
Food.create!({name: "soup", calories: "100", serving_size: "1 unit", carbs: "30", protein: "10", total_fat: "20", sodium: "1000", sugar: "10"})
Food.create!({name: "vegetables", calories: "50", serving_size: "1 unit", carbs: "10", total_fat: "1", sodium: "500", sugar: "2"})

CardioExercise.create!({name: "walking", cals_burned: "100", minutes: "30"})
CardioExercise.create!({name: "running", cals_burned: "200", minutes: "30"})



