class Api::SocialProfilesController < ApplicationController 
  def show   
    @user = User.find(params[:user_id])
    @social_profile = @user.social_profile
    render json: @social_profile
  end
  
  def edit   
    @social_profile = current_user.social_profile 
    render json: @social_profile
  end
  
  def update   
    @social_profile = current_user.social_profile      
    
    if @social_profile.update_attributes(social_params) 
      render json: @social_profile
    else
      render json: @social_profile
    end 
  end
    
   def social_params   
     params.require(:social_profile).permit(:age, :gender, :about_me, :why, 
     :inspir1, :inspir2, :inspir3, :inspir4, :country, :state, :city, :zip,
     :page_title) 
   end
end


