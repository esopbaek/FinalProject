json.array!(@breakfasts) do |breakfast|
  json.partial!("meal", :mealname => breakfast)
end