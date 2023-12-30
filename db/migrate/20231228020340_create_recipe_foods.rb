class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
    t.bigint "recipe_id"
    t.bigint "food_id"
    t.integer "quantity"
    t.references :recipe, foreign_key: true
    t.references :food, foreign_key: true
    t.timestamps
    end
  end
end
