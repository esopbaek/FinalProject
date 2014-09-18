class FoodEntriesController < ApplicationController
  def new
    @entry = FoodEntry.new
    @results = Food.search_by_name(params[:query])
    @page = DiaryPage.find(params[:diary_page_id])
    @meal = params[:meal]
    @get_meal = params[:format]
  end
  
  def createtemp
    @page = DiaryPage.find(params[:diary_page_id])
    @page.food_entries.new(food_id: params[:food_id], meal: params[:meal])
    if @page.save
      redirect_to diary_page_url(@page)
    else
      flash.now[:errors] = @page.errors.full_messages
    end
  end
  
  def create
    @page = DiaryPage.find(params[:diary_page_id])
    
    # params.require(:diary_page)["food_ids"].each do |id|
    #   food = @page.food_entries.new(food_id: id, meal: params[:food_entries][:meal])
    # end
    @page.food_entries.new(food_id: params[:food_id], meal: params[:meal])
    
    if @page.save
      render json: @page
    else
      flash.now[:errors] = @page.errors.full_messages
    end
  end
  
  def destroy
    @page = DiaryPage.find(params[:diary_page_id])
    @entry = FoodEntry.find(params[:id])
    @entry.destroy
    redirect_to diary_page_url(params[:diary_page_id])
  end
  
  def search
    @results = Food.search_by_name(params[:query])
  end
  
  private
  def food_entry_params
    params.require(:food_entries).permit(:food_ids)
  end
  
end

