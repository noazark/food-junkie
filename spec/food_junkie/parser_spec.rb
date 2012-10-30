require 'spec_helper'

describe FoodJunkie::Parser do
  
  before :all do
    @recipe = "Preheat oven to 350 degrees. Lightly grease a baking dish.\r\n\r\nAdd 3 carrots."
  end

  describe "#parse" do
  
    it "should clean the syntax tree" do
      FoodJunkie::Parser.parse(@recipe).children(Treetop::Runtime::SyntaxNode).should be_empty
    end
    
    it "is case insensitive" do
      FoodJunkie::Parser.parse("PREHEAT OVEN to 459 DeGrees").should_not be_nil
      FoodJunkie::Parser.parse("preheat oven to 459 degrees").should_not be_nil
    end

  end

end