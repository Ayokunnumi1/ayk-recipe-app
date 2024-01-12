class ShoppingListsController < ApplicationController
  def shopping_list
  @recipe = Recipe.find(params[:id])
  end
end
