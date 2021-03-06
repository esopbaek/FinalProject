json.set! :name, food["item_name"]
json.set! :calories, (food["nf_calories"].nil? ? 0 : food["nf_calories"])
json.set! :total_fat, (food["nf_total_fat"].nil? ? 0 : food["nf_total_fat"])
json.set! :saturated, food["nf_saturated_fat"]
json.set! :polyunsaturated, food["nf_polyunsaturated_fat"]
json.set! :monounsaturated, food["nf_monounsaturated_fat"]
json.set! :trans, food["nf_trans_fatty_acid"]
json.set! :cholesterol, food["nf_cholesterol"]
json.set! :sodium, (food["nf_sodium"].nil? ? 0 : food["nf_sodium"])
json.set! :carbs, (food["nf_total_carbohydrate"].nil? ? 0 : food["nf_total_carbohydrate"])
json.set! :fiber, food["nf_dietary_fiber"]
json.set! :vitamin_a, food["nf_vitamin_a_dv"]
json.set! :vitamin_c, food["nf_vitamin_c_dv"]
json.set! :calcium, food["nf_calcium_dv"]
json.set! :iron, food["nf_iron_dv"]
json. set! :serving_size, food["nf_serving_size_unit"]
json.set! :servings_per_container, food["nf_servings_per_container"]
json.set! :brand, food["brand_name"]
json.set! :protein, (food["nf_protein"].nil? ? 0 : food["nf_protein"])
json.set! :sugar, (food["nf_sugars"].nil? ? 0 : food["nf_sugars"])
json.set! :serving_size_qty, food["nf_serving_size_qty"]