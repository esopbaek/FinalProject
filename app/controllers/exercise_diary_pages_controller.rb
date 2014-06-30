class ExerciseDiaryPagesController < ApplicationController
  include ApplicationHelper
  
  def create
    
  end
  
  def show
    @entry_date = ExerciseDiaryPage.find(params[:id]).exercise_entry_date
    @page = ExerciseDiaryPage.where("user_id = ? AND exercise_entry_date = ?", current_user.id, @entry_date).first
    @weeks_dates = Array (@entry_date.beginning_of_week..@entry_date.end_of_week)
    @weeks_pages = ExerciseDiaryPage.where("user_id = ?", current_user.id)
                                    .where(:exercise_entry_date => @weeks_dates)
    
    @profile = current_user.diet_profile
    @exercises = @page.cardio_exercises
    
    
    @exercises_for_week =  @weeks_pages.map do |all_exer| 
      all_exer.cardio_exercises
    end.flatten!
    
    @daily_mins_logged = @exercises.inject(0) { |sum, n| sum + n.minutes}
    @daily_cals_burned = @exercises.inject(0) { |sum, n| sum + n.cals_burned}
    @daily_goal_mins = @profile.mins_per_workout
    @weekly_goal_mins = @profile.workouts_per_week*@daily_goal_mins
    @weekly_goal_cals = calculate_calories_burned(@profile)
    if @profile.workouts_per_week == 0 
      @daily_goal_cals = 0
    else 
      @daily_goal_cals = @weekly_goal_cals/@profile.workouts_per_week
    end
    @weekly_mins_logged = @exercises_for_week.inject(0) {|sum, n| sum + n.minutes}
    @weekly_cals_burned = @exercises_for_week.inject(0) {|sum, n| sum + n.cals_burned}

  end
  
  def edit
    
  end
  
  def update
    
  end
end
