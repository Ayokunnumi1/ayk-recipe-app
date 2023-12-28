ActiveRecord::Schema[7.1].define(version: 2023_12_28_025417) do
  # Enable extensions if needed
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at",
 
null: false

  
end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.boolean "is_public", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name", null: false
    t.string "measurement_unit"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "recipe_foods", force: :cascade do
 
|t|
    t.bigint "recipe_id", null: false
    t.bigint "food_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_foods_on_recipe_id"
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
  end

  add_foreign_key "recipes", "users", column: "user_id"
  add_foreign_key "foods", "users", column: "user_id"
  add_foreign_key "recipe_foods", "recipes", column: "recipe_id"
  add_foreign_key "recipe_foods", "foods", column: "food_id"
end