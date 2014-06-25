class DietProfilesController < ApplicationController
  include ApplicationHelper

  def create
    @profile = DietProfile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      @age = calculate_age(@profile)
      SocialProfile.create(age: @age, gender: @profile.gender, user_id: current_user.id)
      render :email
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :new
    end
  end

  def new
    @profile = DietProfile.new
  end

  def email
  end

  def summary
    @profile = DietProfile.find(current_user.diet_profile)
    @progress_date = Date.today + 35
    @BMR = calculate_BMR(@profile)
    @net_cal = calculate_net_cals(@profile)

    @carbs = (@net_cal*0.5/4).to_int
    @fats = (@net_cal*0.3/9).to_int
    @protein = (@net_cal*0.2/4).to_int

    @cals_burned = calculate_calories_burned(@profile)
  end

  def goals
    @profile = DietProfile.find(current_user.diet_profile)
    @progress_date = Date.today + 35
    @BMR = calculate_BMR(@profile)

    if @profile.goal_rate == "Lose 2 pounds per week"
      @cal_deficit = 1000
      @projected_loss = "2 lbs/week"
    elsif @profile.goal_rate == "Lose 1.5 pounds per week"
      @cal_deficit = 750
      @projected_loss = "1.5 lbs/week"
    elsif @profile.goal_rate == "Lose 1 pounds per week"
      @cal_deficit = 500
      @projected_loss = "1 lbs/week"
    elsif @profile.goal_rate == "Lose 0.5 pounds per week"
      @cal_deficit = 250
      @projected_loss = "0.5 lbs/week"
    elsif @profile.goal_rate == "Maintain my current weight"
      @cal_deficit = 0
      @projected_loss = "0 lbs/week"
    elsif @profile.goal_rate == "Gain 0.5 pounds per week"
      @cal_deficit = -250
      @projected_loss = "-0.5 lbs/week"
    else
      @cal_deficit = -500
      @projected_loss = "-1 lbs/week"
    end

    @net_cal = @BMR - @cal_deficit
    @carbs = (@net_cal*0.5/4).to_int
    @fats = (@net_cal*0.3/9).to_int
    @protein = (@net_cal*0.2/4).to_int

    @cals_burned = calculate_calories_burned(@profile)
  end

  def edit
    @profile = DietProfile.find(current_user.diet_profile)
  end

  def update
    @profile = DietProfile.find(current_user.diet_profile)
    if @profile.update_attributes(profile_params)
      redirect_to summary_diet_profile_url
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:current_weight, :goal_weight,
    :height_ft, :height_in, :gender, :activity_level, :user_id, :date, :d_o_b,
    :goal_rate, :workouts_per_week, :mins_per_workout)
  end
end
