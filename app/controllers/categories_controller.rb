class CategoriesController < ApplicationController
  def index
    categories = MealDb::Category.all
    render json: categories
  end
end
