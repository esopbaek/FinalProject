

json.array!(@foods) do |food|
  json.(food, :id, :name, :calories, :total_fat, :saturated, :polyunsaturated,
  :monounsaturated, :trans, :cholesterol, :sodium, :potassium, :carbs, :fiber,
  :vitamin_a, :vitamin_c, :calcium, :iron, :created_at, :updated_at,
  :serving_size, :servings_per_container, :brand, :meal, :protein, :sugar)
end
