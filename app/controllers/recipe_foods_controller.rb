class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id])
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      flash[:success] = " Ingredient created!"
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      flash[:error] = 'Ingredient Not added, try again later'
      render :new
    end
  end
  
  def destroy
  @recipe_food = RecipeFood.find(params[:id])
  @recipe_food.destroy
  redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Food item was successfully deleted.'
  end

  private

  def recipe_food_params
  params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity)
  end
end
