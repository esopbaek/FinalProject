json.array!(@dinners) do |dinner|
  json.partial!("meal", :mealname => dinner)
end