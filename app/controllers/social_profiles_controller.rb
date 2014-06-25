class SocialProfilesController < ApplicationController
  def show
    @social_profile = current_user.social_profile
  end

  def edit

  end

  def update
  end
end
