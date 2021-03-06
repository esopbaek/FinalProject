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

      i = -5
      while i < 50 do
        DiaryPage.create!(entry_date: Date.today + i, user_id: @user.id)
        ExerciseDiaryPage.create!(exercise_entry_date: Date.today + i, user_id: @user.id)
        i+=1
      end
      redirect_to new_diet_profile_url

    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def update
    @user = current_user
    
    if @user.update_attributes(user_params)
      redirect_to dashboard_url
    else
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :profile_photo)
  end
end
