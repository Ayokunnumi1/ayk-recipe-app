require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:food) { Food.create!(name: 'Test Food', user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all foods as @foods' do
      get :index
      expect(assigns(:foods)).to eq([food])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested food as @food' do
      get :show, params: { id: food.id }
      expect(assigns(:food)).to eq(food)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new food' do
        expect {
          post :create, params: { food: { name: 'New Food' } }
        }.to change(Food, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new food' do
        expect {
          post :create, params: { food: { name: nil } }
        }.to_not change(Food, :count)
      end
    end
  end
end