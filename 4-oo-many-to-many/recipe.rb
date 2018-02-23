# pry is our debugging tool
require 'pry'
# faker is a gem that allows us to simulate a bunch of data very quickly
require 'faker'

class Recipe
  attr_accessor :name, :serving_size

  @@all = []

  def initialize(name, serving_size=1)
    @name = name
    @serving_size = serving_size
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end
  end

  def ingredients
    recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.ingredient}
  end

  # below is a way we could get the ingredients with just one method instead of two... however, I would recommend using the methods above (one method to grab the associations and one to actually grab the ingredients)
  # def ingredients
  #   RecipeIngredient.all.map do |ri|
  #     ri.ingredient if ri.recipe == self
  #   end.compact
  # end

  # we didn't get to this in lecture, but here is one way we might grab the ingredients with their amounts, in this case, returning an array of hashes, where each hash has a key of the ingredient's name and a value of the amount
  def ingredients_with_amounts
    recipe_ingredients.each_with_index.map do |ri, index|
        {
          ri.ingredient.name => ri.amount
        }
    end
  end

  # another method that would be useful might be #add_ingredient, which would take an ingredient as an argument and create the association.  We *could* build a similar #add_recipe instance method on Ingredient, but does that make as much sense?  My feeling is that it doesn't.  What do you think?
  def add_ingredient(ingredient)
    RecipeIngredient.new(self, ingredient)
  end

end

# use faker to make a bunch of recipes
5.times do
  Recipe.new(Faker::Food.dish)
end
