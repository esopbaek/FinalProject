class SocialProfilesController < ApplicationController 
  def show   
    @social_profile = current_user.social_profile 
  end
  
  def edit   
    @social_profile = current_user.social_profile 
  end
  
  def update   
    @social_profile = current_user.social_profile      
    
    if @social_profile.update_attributes(social_params) 
      redirect_to social_profile_url
    else
      flash.now[:errors] = @social_profile.errors.full_messages
      render :edit
    end 
  end
    
   def social_params   
     params.require(:social_profile).permit(:age, :gender, :about_me, :why, 
     :inspir1, :inspir2, :inspir3, :inspir4, :country, :state, :city, :zip,
     :page_title) 
   end
end


