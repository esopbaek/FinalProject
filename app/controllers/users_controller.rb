class UsersController < ApplicationController
  include ApplicationHelper
  
  before_action :require_signed_in!, :only => [:show]
  before_action :require_signed_out!, :only => [:create, :new]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      Measurement.create(name: "weight", user_id: @user.id, unit: "lbs")
      i = -365
      while i < 365 do
        DiaryPage.create!(entry_date: Date.today + i, user_id: @user.id)
        
        i+=1
      end
      redirect_to new_diet_profile_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end

  def dashboard
    @profile = current_user.diet_profile
    @net_cal = calculate_net_cals(@profile)
    @breakfasts = meal_foods(todays_page, "breakfast")

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
    
    @progress = @starting_weight - @current_weight
    if signed_in?
      render :dashboard
    else
      render 'static_pages/home'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
