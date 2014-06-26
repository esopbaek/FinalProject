class FoodEntriesController < ApplicationController
  def new
    @entry = FoodEntry.new
    @foods = Food.all
    @page = DiaryPage.find(params[:diary_page_id])
  end
  
  def create
    @entry = FoodEntry.new(food_entry_params)
    @page = DiaryPage.find(params[:diary_page_id])
    if @entry.save
      redirect_to diary_page_url(@page)
      fail
    else
      flash.now[:errors] = @entry.errors.full_messages
    end
  end
  
  private
  def food_entry_params
    params.require(:food_entry).permit(:diary_page_id, :food_id)
  end
end
