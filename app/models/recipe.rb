class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    validates :title, presence: true
    validates :title, length: { minimum: 5 }
end
