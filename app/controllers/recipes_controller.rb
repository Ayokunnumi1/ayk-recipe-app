class RecipesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    @recipes = current_user.recipes.includes(:user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe Successfully Added'
      redirect_to recipes_path
    else
      flash[:error] = 'Recipe Not Saved, Try again later'
      render :new
    end
  end

  def destroy
  @recipe = current_user.recipes.find(params[:id])
  @recipe.destroy
  redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def shopping_list
  @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :is_public, :quantity)
  end
end
