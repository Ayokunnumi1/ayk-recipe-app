class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(is_public: true)
    @users = User.all
  end
end


