require 'spec_helper'

describe FoodJunkie::Step do

  let(:step_string) do
    <<-END_RECIPE
      3 eggs for 5 minutes.
    END_RECIPE
  end

  let(:step) do
    FoodJunkie::Step.new(
      FoodJunkie::Parsers::RecipeParser.new.parse(step_string.to_s).steps.first
    )
  end

  it "can be initialized with a string" do
    step = FoodJunkie::Step.new step_string
    step.syntax_node.should be_kind_of FoodJunkie::SyntaxNodes::Step
  end

  it "extrapolates ingredients" do
    step.ingredients.count.should eq 1
  end

  it "ingredients are of type Ingredient" do
    step.ingredients.each do |ingredient|
      ingredient.should be_kind_of FoodJunkie::Ingredient
    end
  end

  it "summarizes the step's total cook and prep time" do
    step.total_time.should eq 5 * 60
  end

end