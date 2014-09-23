class Api::DiaryPagesController < ApplicationController
  include ApplicationHelper
  
  def create
    
  end
  
  def index
    @diary_pages = DiaryPage.all
    render "index"
  end

  
  def show
    @entry_date = DiaryPage.find(params[:id]).entry_date
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, @entry_date).first
    @breakfasts = meal_foods(@page, "breakfast")
    @lunches = meal_foods(@page, "lunch")
    @dinners = meal_foods(@page, "dinner")
    @snacks = meal_foods(@page, "snack")
    
    @total_lunch_cals = @lunches.inject(0) { |sum, n| sum + n.calories}
    @total_lunch_carbs = @lunches.inject(0) { |sum, n| sum + n.carbs}
    @total_lunch_fat = @lunches.inject(0) { |sum, n| sum + n.total_fat}
    @total_lunch_protein = @lunches.inject(0) { |sum, n| sum + n.protein}
    @total_lunch_sodium = @lunches.inject(0) { |sum, n| sum + n.sodium}
    @total_lunch_sugar = @lunches.inject(0) { |sum, n| sum + n.sugar}
    
    @total_dinner_cals = @dinners.inject(0) { |sum, n| sum + n.calories}
    @total_dinner_carbs = @dinners.inject(0) { |sum, n| sum + n.carbs}
    @total_dinner_fat = @dinners.inject(0) { |sum, n| sum + n.total_fat}
    @total_dinner_protein = @dinners.inject(0) { |sum, n| sum + n.protein}
    @total_dinner_sodium = @dinners.inject(0) { |sum, n| sum + n.sodium}
    @total_dinner_sugar = @dinners.inject(0) { |sum, n| sum + n.sugar}
    
    @total_breakfast_cals = @breakfasts.inject(0) { |sum, n| sum + n.calories}
    @total_breakfast_carbs = @breakfasts.inject(0) { |sum, n| sum + n.carbs}
    @total_breakfast_fat = @breakfasts.inject(0) { |sum, n| sum + n.total_fat}
    @total_breakfast_protein = @breakfasts.inject(0) { |sum, n| sum + n.protein}
    @total_breakfast_sodium = @breakfasts.inject(0) { |sum, n| sum + n.sodium}
    @total_breakfast_sugar = @breakfasts.inject(0) { |sum, n| sum + n.sugar}
    
    @total_snack_cals = @snacks.inject(0) { |sum, n| sum + n.calories}
    @total_snack_carbs = @snacks.inject(0) { |sum, n| sum + n.carbs}
    @total_snack_fat = @snacks.inject(0) { |sum, n| sum + n.total_fat}
    @total_snack_protein = @snacks.inject(0) { |sum, n| sum + n.protein}
    @total_snack_sodium = @snacks.inject(0) { |sum, n| sum + n.sodium}
    @total_snack_sugar = @snacks.inject(0) { |sum, n| sum + n.sugar}
    
    @total_cals = @total_lunch_cals + @total_dinner_cals + @total_breakfast_cals + @total_snack_cals
    @total_carbs = @total_lunch_carbs + @total_dinner_carbs + @total_breakfast_carbs + @total_snack_carbs
    @total_fat = @total_lunch_fat + @total_dinner_fat + @total_breakfast_fat + @total_snack_fat
    @total_protein = @total_lunch_protein + @total_dinner_protein + @total_breakfast_protein + @total_snack_protein
    @total_sodium = @total_lunch_sodium + @total_dinner_sodium + @total_breakfast_sodium + @total_snack_sodium
    @total_sugar = @total_lunch_sugar + @total_dinner_sugar + @total_breakfast_sugar + @total_snack_sugar
    
    @profile = current_user.diet_profile
    @target_cals = calculate_net_cals(@profile)
    @target_carbs = (@target_cals*0.5/4).to_int
    @target_fats = (@target_cals*0.3/9).to_int
    @target_protein = (@target_cals*0.2/4).to_int
    @target_sodium = 2300
    @target_sugar = (@target_cals * 0.15/4).to_int
    @yest = DiaryPage.where("entry_date = ?", @entry_date - 1).first
    @tomo = DiaryPage.where("entry_date = ?", @entry_date + 1).first
    render "show"
  end
  
  def lunches
    @entry_date = DiaryPage.find(params[:id]).entry_date
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, @entry_date).first
    @lunches = meal_foods(@page, "lunch")
    render "lunches"
  end
  
  def dinners
    @entry_date = DiaryPage.find(params[:id]).entry_date
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, @entry_date).first
    @dinners = meal_foods(@page, "dinner")
    render "dinners"    
  end
  
  def snacks
    @entry_date = DiaryPage.find(params[:id]).entry_date
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, @entry_date).first
    @snacks = meal_foods(@page, "snack")
    render "snacks"
  end
  
  def breakfasts
    @entry_date = DiaryPage.find(params[:id]).entry_date
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, @entry_date).first
    @breakfasts = meal_foods(@page, "breakfast")
    render "breakfasts"
  end

  
  def edit
    
  end
  
  def update
    
  end
end
