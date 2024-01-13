require 'rails_helper'

RSpec.feature "RecipeViews", type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:recipe) { Recipe.create!(name: 'Test Recipe', description: 'Test Description', is_public: true, user: user) }

  before do
    sign_in user
    visit recipes_path
  end

  scenario "user sees the recipe details" do
    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('Test Description')
  end
end