class DiaryPagesController < ApplicationController
  include ApplicationHelper
  
  def create
    
  end
  
  def show
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, Date.today).first
    @breakfasts = meal_foods(@page, "breakfast")
    @lunches = meal_foods(@page, "lunch")
    @dinners = meal_foods(@page, "dinner")
    @snacks = meal_foods(@page, "snack")
    
    @all_meals = @lunches + @dinners + @breakfasts + @snacks
    
    @total_cals = @all_meals.inject(0) { |sum, n| sum + n.calories}
    @total_carbs = @all_meals.inject(0) { |sum, n| sum + n.carbs}
    @total_fat = @all_meals.inject(0) { |sum, n| sum + n.total_fat}
    @total_protein = @all_meals.inject(0) { |sum, n| sum + n.protein}
    @total_sodium = @all_meals.inject(0) { |sum, n| sum + n.sodium}
    @total_sugar = @all_meals.inject(0) { |sum, n| sum + n.sugar}
  end
  
  def edit
    
  end
  
  def update
    
  end
end
