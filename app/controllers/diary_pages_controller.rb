class DiaryPagesController < ApplicationController
  def create
    
  end
  
  def show
    @page = DiaryPage.where("user_id = ? AND entry_date = ?", current_user.id, Date.today).first
  end
  
  def edit
    
  end
  
  def update
    
  end
end
