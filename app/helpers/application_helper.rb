module ApplicationHelper
  def calculate_age(diet_profile)
    (Date.today - diet_profile.d_o_b).to_int/365
  end

  def calculate_BMR(profile)
    part_1 = (10 * (profile.current_weight/2.2046))

    height_in_cm = ((profile.height_ft * 12) + profile.height_in) * 2.54
    part_2 = (6.25 * height_in_cm)

    part_3 = 5 * (((Date.today - profile.d_o_b).to_int)/365)
    bmr = part_1 + part_2 - part_3

    if profile.gender == "male"
      bmr = bmr + 5
    else
      bmr = bmr - 161
    end

    if profile.activity_level == "Sedentary"
      bmr = (bmr*1.25).to_int
    elsif profile.activity_level == "Lightly Active"
      bmr = (bmr*1.4)
    elsif profile.activity_level == "Active"
      bmr = (bmr*1.5)
    else
      bmr = (bmr*1.8)
    end
    bmr
  end

  def calculate_net_cals(profile)
    net_cal = calculate_BMR(profile)
    if profile.goal_rate == "Lose 2 pounds per week"
      net_cal -= 1000
    elsif profile.goal_rate == "Lose 1.5 pounds per week"
      net_cal -= 750
    elsif profile.goal_rate == "Lose 1 pounds per week"
      net_cal -= 500
    elsif profile.goal_rate == "Lose 0.5 pounds per week"
      net_cal -= 250
    elsif profile.goal_rate == "Maintain my current weight"
      net_cal -= 0
    elsif profile.goal_rate == "Gain 0.5 pounds per week"
      net_cal += 250
    else
      net_cal += 500
    end
    net_cal
  end

  def calculate_calories_burned(profile)
    (0.04 * (profile.workouts_per_week * profile.mins_per_workout)) * profile.current_weight
  end
end
