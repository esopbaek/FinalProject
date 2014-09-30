class Api::UsersController < ApplicationController
  include ApplicationHelper
  wrap_parameters :user, include: [:profile_photo]

  before_action :require_signed_out!, :only => [:create, :new]

  def new
    @user = User.new
  end
  
  def search
    if params[:query] == ""
      @users = User.all
    else
      @users = User.search_by_username(params[:query])
    end
    render "index"
  end
  
  def show
    @user = User.find(params[:id])
    @social_profile = @user.social_profile
    render "show"
  end
  
  def index
    @users = User.all
    render "index"
  end

  def current_user
    @user ||= User.find_by_session_token(session[:token])
    render "show"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      Measurement.create(name: "weight", user_id: @user.id, unit: "lbs")

      i = -365
      while i < 365 do
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
    @user = @current_user ||= User.find_by_session_token(session[:token])
    
    if @user.update_attributes(user_params)
      render json: @user
    else
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :profile_photo)
  end
end
