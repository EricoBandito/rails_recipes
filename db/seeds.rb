# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'

url = "http://www.recipepuppy.com/api/"
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)['results']

puts pp(data)

Recipe.destroy_all

data.each do |json_recipe|
    recipe = Recipe.create(title: json_recipe['title'],
                  href: json_recipe['href'],
                  thumbnail: json_recipe['thumbnail'])


    ingredient_array = json_recipe['ingredients'].split(',')
    ingredient_array.each do |ingredient|

        if Ingredient.exists?(:name => ingredient)
            ingredient_id  = Ingredient.find_by(name: ingredient).id
            RecipeIngredient.create(recipe_id: recipe.id,
                                    ingredient_id: ingredient_id)

        else
            ingredient = Ingredient.create(name: ingredient)
            RecipeIngredient.create(recipe_id: recipe.id,
                                    ingredient_id: ingredient.id)
        end
    end
end

200.times do
    recipe = Recipe.create(title: Faker::Food.dish,
                           href: 'https://www.allrecipes.com/recipe/90236/ginger-champagne/',
                           thumbnail: '')

    2..6.times do
        ingredient = Faker::Food.ingredient

        if Ingredient.exists?(:name => ingredient)
            ingredient_id  = Ingredient.find_by(name: ingredient).id
            RecipeIngredient.create(recipe_id: recipe.id,
                                    ingredient_id: ingredient_id)
        else
            ingredient = Ingredient.create(name: ingredient)
            RecipeIngredient.create(recipe_id: recipe.id,
                                    ingredient_id: ingredient.id)
        end

    end
end

