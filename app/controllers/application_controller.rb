class ApplicationController < ActionController::Base
  protect_from_forgery

  # Expose these methods to the views
  helper_method :current_user, :signed_in?, :todays_page, :todays_exercise_page

  private
  
  def todays_page
    DiaryPage.where("user_id = ? AND entry_date = ?", current_user, Date.today).first
  end
  
  def todays_exercise_page
    ExerciseDiaryPage.where("user_id =? AND exercise_entry_date = ?", current_user, Date.today).first
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:token] = user.reset_session_token!
  end

  def sign_out
    current_user.try(:reset_session_token!)
    session[:token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def require_signed_out!
    redirect_to dashboard_url if signed_in?
  end
end
