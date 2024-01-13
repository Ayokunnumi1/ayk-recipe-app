require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', user: user) }
  let(:food) { Food.create!(name: 'Test Food', user: user) }
  let(:recipe_food) { RecipeFood.create!(recipe: recipe, food: food) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new recipe_food as @recipe_food' do
      get :new, params: { recipe_id: recipe.id }
      expect(assigns(:recipe_food)).to be_a_new(RecipeFood)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe_food' do
        expect {
          post :create, params: { recipe_food: { recipe_id: recipe.id, food_id: food.id } }
        }.to change(RecipeFood, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new recipe_food' do
        expect {
          post :create, params: { recipe_food: { recipe_id: nil, food_id: nil } }
        }.to_not change(RecipeFood, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the recipe_food' do
      recipe_food
      expect {
        delete :destroy, params: { id: recipe_food.id }
      }.to change(RecipeFood, :count).by(-1)
    end
  end
end