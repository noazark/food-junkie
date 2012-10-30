require 'spec_helper'

describe FoodJunkie::IngredientsParser do
  before :all do
    @parser = FoodJunkie::IngredientsParser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end

  describe "sets" do
    
    it "measurement" do
      parse("9 gallons of juice").measurement.should_not be_nil
    end
    
    it "substance" do
      parse("4 oz of carrots").substance.should_not be_nil
    end

  end

  it "should parse with or without preposition" do
    parse("five oz of carrots").should_not be_nil
    parse("five carrots").should_not be_nil
  end

  it "parses multi-word substance" do
    parse("1 gallon of whole milk").should_not be_nil
  end

  it "breaks parse for prepositions" do
    parse("1 carrot until smooth").should be_nil
  end

  it "breaks parse for conjunctions" do
    parse("1 carrot on high").should be_nil
  end

  it "breaks parse for terminating punctuation" do
    parse("1 carrot.").should be_nil
  end

  it "requires space in-between alphabetical-number quantity and substance" do
    parse("onecarrot").should be_nil
    parse("one carrot").should_not be_nil
  end

  it "parses compound ingredients" do
    parse("3 6.5 ounce cans of minced clams").should_not be_nil
  end

  context "parses confusing substances" do
    it "containing conjunctions" do
      parse("1/2 teaspoon of baking soda").should_not be_nil
    end
    it "containing prepositions" do
      parse("1/2 teaspoon of ground thyme").should_not be_nil
    end
  end

  it "parses portioned units" do
    parse("10 pods of okra").should_not be_nil
  end

  it "requires a space in-between measurement and substance for generic volumes" do
    parse("8ths").should be_nil
  end

end
