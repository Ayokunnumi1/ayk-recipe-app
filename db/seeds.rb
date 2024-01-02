# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create(name: 'Joy')
first_user_food = first_user.foods.create(name: 'Amala & Gbegiri soup', measurement_unit: 'grams', price: 100.00, quantity: 50)
first_user_recipe = first_user.recipes.create(name: 'Amala & Gbegiri recipe', preparation_time: 10, cooking_time: 30, description: 'Boil water to prepare Amala, cook beans to prepare gbegiri', is_public: true )