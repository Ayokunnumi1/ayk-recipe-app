require 'rails_helper'

RSpec.feature "Foods", type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'Test User', email: 'test@example.com', password: 'password') }
  let!(:food) { Food.create!(name: 'Test Food', measurement_unit: 'kg', price: 10, user: user) }

  before do
    sign_in user
    visit foods_path
  end

  scenario "user sees the list of foods" do
    expect(page).to have_content('Test Food')
    expect(page).to have_content('kg')
    expect(page).to have_content('10')
  end

  scenario "user sees the delete button for each food" do
    expect(page).to have_button('Delete')
  end
end