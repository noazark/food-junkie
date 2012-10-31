require 'spec_helper'

describe FoodJunkie::Ingredient do

  let(:ingredient_string) do
    "4 cups of flour"
  end

  let(:ingredient) do
    FoodJunkie::Ingredient.new(
      FoodJunkie::Parsers::IngredientsParser.new.parse(ingredient_string.to_s)
    )
  end

  it "can be initialized with a string" do
    ingredient = FoodJunkie::Ingredient.new ingredient_string
    ingredient.syntax_node.should be_kind_of FoodJunkie::SyntaxNodes::Ingredient
  end
end