require 'uri'

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
    @food = Food.new(food_params)
    if @food.save
      render "show"
    else
      render json: {}
    end
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

  private
  
  def food_params
    params.require(:food).permit(:name, :calories, :total_fat,:saturated,:polyunsaturated, :monounsaturated,:trans, 
:cholesterol, :sodium, :carbs, :fiber, :vitamin_a, :vitamin_c, :calcium, :iron, :created_at, :updated_at,
 :serving_size, :servings_per_container, :brand, :meal, :protein, :sugar, :serving_size_qty)
  end
  
end
