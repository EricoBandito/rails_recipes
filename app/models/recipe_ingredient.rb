class RecipeIngredient < ApplicationRecord
    belongs_to :ingredient
    belongs_to :recipe
    validates :recipe_id, :ingredient_id, presence: true
end
