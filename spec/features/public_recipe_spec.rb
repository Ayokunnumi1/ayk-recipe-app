require 'rails_helper'

RSpec.feature "PublicRecipeViews", type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:public_recipe) { Recipe.create!(name: 'Public Recipe', description: 'Public Description', is_public: true, user: user) }
  let!(:private_recipe) { Recipe.create!(name: 'Private Recipe', description: 'Private Description', is_public: false, user: user) }

  scenario "user sees the list of public recipes on the index page" do
    sign_in user
    visit public_recipes_path
    expect(page).to have_content('Public Recipe')
    expect(page).not_to have_content('Private Recipe')
  end
end