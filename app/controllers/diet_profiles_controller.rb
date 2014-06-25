class DietProfilesController < ApplicationController
  def create
    @profile = DietProfile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
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
    
    @part_1 = (10 * @profile.current_weight * 0.45)

    @height_in_cm = ((@profile.height_ft * 12) + @profile.height_in) * 2.54
    @part_2 = (6.25 * @height_in_cm)

    @part_3 = 5 * (((Date.today - @profile.d_o_b).to_int)/365)
    @BMR = @part_1 + @part_2 - @part_3

    if @profile.gender == "male"
      @BMR = @BMR + 10
    else
      @BMR = @BMR - 161
    end
    
    if @profile.activity_level == "Sedentary"
      @BMR = (@BMR*1.252).to_int
    elsif @profile.activity_level == "Lightly Active"
      @BMR = (@BMR*1.3985)
    elsif @profile.activity_level == "Active"
      @BMR = (@BMR*1.5974)
    else
      @BMR = (@BMR*1.802)
    end
    
    @carbs = (@BMR*0.5/4).to_int
    @fats = (@BMR*0.3/9).to_int
    @protein = (@BMR*0.2/4).to_int
  end
  
  def goals
  end
  
  private
  def profile_params
    params.require(:profile).permit(:current_weight, :goal_weight, 
    :height_ft, :height_in, :gender, :activity_level, :user_id, :date, :d_o_b,
    :goal_rate, :workouts_per_week, :mins_per_workout)
  end
end
