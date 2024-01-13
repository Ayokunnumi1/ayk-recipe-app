require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'validations' do
    it 'validates presence of name' do
      recipe = Recipe.new(name: nil)
      expect(recipe.valid?).to be_falsey
      expect(recipe.errors[:name]).to include("can't be blank")
    end
  end

  describe 'Associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many recipe_foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many foods through recipe_foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:recipe_foods)
    end
  end
end