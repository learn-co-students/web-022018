require_relative "recipe.rb"
require_relative "ingredient.rb"
require_relative "recipe_ingredient.rb"

# make four associations just to play with
RecipeIngredient.new(Recipe.all[0], Ingredient.all[0])
RecipeIngredient.new(Recipe.all[0], Ingredient.all[1])
RecipeIngredient.new(Recipe.all[0], Ingredient.all[2])
RecipeIngredient.new(Recipe.all[0], Ingredient.all[3])

binding.pry

# sometimes binding.pry won't catch if it's the last line in the file, so we add a friendly sayonara :)
puts "goodbye"
