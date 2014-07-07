class Api::FoodEntriesController < ApplicationController
  def new
    @entry = FoodEntry.new
    @foods = Food.search_results(params[:query])
    @page = DiaryPage.find(params[:diary_page_id])
  end
  
  def create
    @page = DiaryPage.find(params[:diary_page_id])
    
    params.require(:diary_page)["food_ids"].each do |id|
      food = @page.food_entries.new(food_id: id, meal: params[:food_entries][:meal])
    end
    
    if @page.save
      redirect_to diary_page_url(@page)
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
  
  def index
    @results = Food.all
    render json: @results
  end
  
  private
  def food_entry_params
    params.require(:food_entries).permit(:food_ids)
  end
  
end

