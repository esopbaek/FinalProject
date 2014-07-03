class Api::FoodsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def database
    # @results = Food.search_by_name(params[:query])
    @users = User.all
    @foods = Food.all
    render "index"
  end

  def update
  end

  def destroy
  end

end
