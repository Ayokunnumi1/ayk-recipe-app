require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates presence of name' do
      user = User.new(name: nil)
      expect(user.valid?).to be_falsey
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  context 'associations' do
    let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
    let(:food) { Food.create(name: 'Test Food', user: user) }
    let(:recipe) { Recipe.create(name: 'Test Recipe', user: user) }

    it 'has many foods' do
      user.foods << food
      expect(user.foods).to include(food)
    end

    it 'has many recipes' do
      user.recipes << recipe
      expect(user.recipes).to include(recipe)
    end
  end
end