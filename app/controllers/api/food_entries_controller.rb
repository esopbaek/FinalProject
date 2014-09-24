class Api::FoodEntriesController < ApplicationController
  def new
    @entry = FoodEntry.new
    @foods = Food.search_results(params[:query])
    @page = DiaryPage.find(params[:diary_page_id])
  end
  
  def create
    @page = DiaryPage.find(params[:diary_page_id])
    @page.food_entries.new(food_id: params[:food_id], meal: params[:meal], diary_page_id: params[:diary_page_id])
    
    if @page.save
      head :ok
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

