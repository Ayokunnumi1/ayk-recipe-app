require 'rails_helper'

RSpec.feature "ShoppingListViews", type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:food) { Food.create!(name: 'Test Food', price: 10, user: user) }
  let(:recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', user: user) }
  let!(:recipe_food) { RecipeFood.create!(recipe: recipe, food: food, quantity: 2) }

  scenario "user sees the correct count and total value of food items on the shopping list page" do
    sign_in user
    visit shopping_list_recipe_path(recipe)
    expect(page).to have_content('Amount of food items to buy:1')
    expect(page).to have_content('Total Value of food needed:10.0')  # Update the expected total value here
  end
end