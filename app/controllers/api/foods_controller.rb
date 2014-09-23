class Api::FoodsController < ApplicationController

  def index
    @foods = Food.all
    render json: @foods
  end

  def show
    @food = Food.find(params[:id])
    render "show"
  end

  def new
  end

  def create
  end

  def edit
  end

  def search
    if params[:query]
      results = Food.search_results(params[:query])
      parsed_results = JSON.parse(RestClient.get(results))
      @matching_foods = parsed_results["hits"].collect { |result| result["fields"] }
      render "search_results"
    else 
      render json: {}
    end
  end

  def update
  end

  def destroy
  end

end
