require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', user: user) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        expect {
          post :create, params: { recipe: { name: 'New Recipe', description: 'Test Description' } }
        }.to change(Recipe, :count).by(1)
      end

      it 'redirects to the recipes path' do
        post :create, params: { recipe: { name: 'New Recipe', description: 'Test Description' } }
        expect(response).to redirect_to(recipes_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new recipe' do
        expect {
          post :create, params: { recipe: { name: nil } }
        }.to_not change(Recipe, :count)
      end

      it 're-renders the new method' do
        post :create, params: { recipe: { name: nil } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the recipe' do
      recipe
      expect {
        delete :destroy, params: { id: recipe.id }
      }.to change(Recipe, :count).by(-1)
    end

    it 'redirects to recipes#index' do
      delete :destroy, params: { id: recipe.id }
      expect(response).to redirect_to(recipes_path)
    end
  end
end