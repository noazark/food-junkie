require 'spec_helper'

describe FoodJunkie::Recipe do

  let(:recipe) do
    FoodJunkie::Recipe.new <<-END_RECIPE
      3 eggs and 13 pieces of fish
    END_RECIPE
  end

end