require 'spec_helper'

describe FoodJunkie::Recipe do

  let(:recipe) do
    FoodJunkie::Recipe.new <<-END_RECIPE
      3 eggs and 13 pieces of fish.

      Bake for 30 minutes.
    END_RECIPE
  end

  it "breaks a recipe into steps" do
    recipe.steps.count.should eq 2
  end

  it "extrapolates ingredients" do
    recipe.steps.count.should eq 2
  end

  it "summarizes the recipe's total cook and prep time" do
    recipe.total_time.should eq 30 * 60
  end

end