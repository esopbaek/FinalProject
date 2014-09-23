json.array!(@lunches) do |lunch|
  json.partial!("meal", :mealname => lunch)
end
