class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  def index
    @recipes = current_user.recipes.all
  end

  def show; end

  def new
    @recipe = Food.new
  end

  def create
    @recipe = Recipe.new food_params

    if @recipe.save
      flash[:success] = 'Recipe successfully created!'
      redirect_to @recipe
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'Recipe deleted'
    redirect_to recipes_url
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
