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
      Measurement.create(name: 'weight', user_id: 1)
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
    # @exercise_total_cals = Exercise.where("created_at > ? AND created_at < ?",
    #                         Date.yesterday, Date.tomorrow)
    #                       .sum(:cals_burned)
    # @food_total_cals = Food.where("created_at > ? AND created_at < ?",
    #                     Date.yesterday, Date.tomorrow)
    #                   .sum(:calories)
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
