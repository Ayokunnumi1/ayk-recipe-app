require 'rails_helper'

RSpec.describe PublicRecipesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:public_recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', is_public: true, user: user) }
  let(:private_recipe) { Recipe.create!(name: 'Private Recipe', description: 'Private Description', is_public: false, user: user) }

  describe 'GET #index' do
    it 'assigns only public recipes as @public_recipes' do
      public_recipe
      private_recipe
      get :index
      expect(assigns(:public_recipes)).to eq([public_recipe])
    end

    it 'assigns all users as @users' do
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end
end