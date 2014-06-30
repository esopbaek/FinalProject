class FoodsController < ApplicationController
  
  def new
  end
  
  def create
  end
  
  def edit
  end
  
  def search
    @results = Food.search_by_name(params[:query])
  end
  
  def update
  end
  
  def destroy
  end

  def index
  end
end
