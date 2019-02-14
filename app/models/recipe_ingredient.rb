class RecipeIngredient < ApplicationRecord
    belongs_to :ingredient
    belongs_to :recipe
    validates :id, :recipe_id, :ingredient_id, presence: true
end
