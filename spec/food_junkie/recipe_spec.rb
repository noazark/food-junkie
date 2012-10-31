require 'spec_helper'

describe FoodJunkie::Recipe do

  let(:recipe_string) do
    <<-END_RECIPE
      3 eggs and 13 pieces of fish.

      Bake for 30 minutes.
    END_RECIPE
  end

  let(:recipe) do
    FoodJunkie::Recipe.new(
      FoodJunkie::Parsers::RecipesParser.new.parse(recipe_string.to_s)
    )
  end

  it "can be initialized with a string" do
    recipe = FoodJunkie::Recipe.new recipe_string
    recipe.syntax_node.should be_kind_of FoodJunkie::SyntaxNodes::Recipe
  end

  it "breaks a recipe into steps" do
    recipe.steps.count.should eq 2
  end

  it "extrapolates ingredients" do
    recipe.ingredients.count.should eq 2
  end

  it "summarizes the recipe's total cook and prep time" do
    recipe.total_time.should eq 30 * 60
  end

end