# RecipeIngredient is our join model between Recipe and Ingredient.  Its only job is to keep track of relationships between recipes and ingredients.  Notice that whenever we make a RecipeIngredient instance, the associated recipes and ingredients automatically know about each other.  We say, "Recipes have many ingredients through RecipeIngredients", and "Ingredients have many recipes through RecipeIngredients".  That's why this is called a "has-many-through" relationship.
class RecipeIngredient
  # some join models will hold the two related models and nothing else, but in this case, it makes sense for it to hold the amount as well
  attr_accessor :recipe, :ingredient, :amount
  @@all = []

  def initialize(recipe, ingredient, amount="1 teaspoon")
    @recipe = recipe
    @ingredient = ingredient
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end
end
