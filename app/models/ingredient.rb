class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :id, :name, presence: true
  validates :name, length: { minimum: 3 }
end
