class DashboardsController < ApplicationController
  include ApplicationHelper
  
  def show
    @user = current_user
    @profile = current_user.diet_profile
    @net_cal = calculate_net_cals(@profile)
    @breakfasts = meal_foods(todays_page, "breakfast")

    @daily_exercises = todays_exercise_page.cardio_exercises
    @total_exercise_cals = @daily_exercises.inject(0) { |sum, n| sum + n.cals_burned }

    @lunches = meal_foods(todays_page, "lunch")
    @dinners = meal_foods(todays_page, "dinner")
    @snacks = meal_foods(todays_page, "snack")

    @total_lunch_cals = @lunches.inject(0) { |sum, n| sum + n.calories}
    @total_dinner_cals = @dinners.inject(0) { |sum, n| sum + n.calories}
    @total_breakfast_cals = @breakfasts.inject(0) { |sum, n| sum + n.calories}
    @total_snack_cals = @snacks.inject(0) { |sum, n| sum + n.calories}


    @total_food_cals = @total_lunch_cals + @total_dinner_cals + @total_breakfast_cals + @total_snack_cals
    @weight = current_user.measurements.first
    @starting_weight = @weight.logs.first.amount
    @current_weight = @weight.logs.last.amount
    
    @cals_remaining = @net_cal - (@total_food_cals - @total_exercise_cals)
    @progress = @starting_weight - @current_weight
    @total_cals_consumed = @total_food_cals - @total_exercise_cals
    @posts = Post.where("user_id = ?", current_user.id)
    if signed_in?
      render :show
    else
      render 'static_pages/home'
    end  
  end
end
