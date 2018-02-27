# pry is our debugging tool
require 'pry'
# faker is a gem that allows us to simulate a bunch of data very quickly
require 'faker'

class Ingredient
  attr_accessor :name, :food_group

  @@all = []

  def initialize(name, food_group="")
    @name = name
    @food_group = food_group
    @@all << self
  end

  def self.all
    @@all
  end

  # return all recipe_ingredients that include the ingredient instance the method is called on
  def recipe_ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.ingredient == self
    end
  end

  # use the previous method to collect and return all the recipes that include a particular ingredient
  def recipes
    recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.recipe}
  end

end

# make some fake data
5.times do
  Ingredient.new(Faker::Food.ingredient)
end
