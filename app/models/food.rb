class Food < ApplicationRecord
belongs_to :user
has_many :recipeFood

validates :name, presence: true
end