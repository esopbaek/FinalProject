class SiteController < ApplicationController
  def root
    @foods = Food.all
    render "root"
  end
end
