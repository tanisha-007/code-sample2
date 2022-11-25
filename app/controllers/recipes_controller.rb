class RecipesController < ApplicationController

  def index
    recepies = MealDb::Recipe.filter(params[:category])
    render json: recepies
  end

  def show
    recipe = MealDb::RecipeDetail.lookup(params[:id])
    render json: recipe
  end
end
