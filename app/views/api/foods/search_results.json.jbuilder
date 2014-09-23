json.array!(@matching_foods) do |food|
  json.partial!("food_conversion", :food => food)
end