json.array!(@snacks) do |snack|
  json.partial!("meal", :mealname => snack)
end