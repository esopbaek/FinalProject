class Api::FoodsController < ApplicationController
  
  def index
    @foods = Food.all
    render json: @foods
  end

  def show
    @food = Food.find(params[:id])
    render json: @food
  end

  def new
  end

  def create
  end

  def edit
  end

  def database
    results = Food.search_results("banana")
    parsed_results = JSON.parse(RestClient.get(results))
    @matching_foods = parsed_results["hits"].collect { |result| result["fields"] }
    render json: @matching_foods
  end

  def update
  end

  def destroy
  end

end
