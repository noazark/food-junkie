require 'spec_helper'

describe FoodJunkie::MeasurementsParser do
  before :all do
    @parser = FoodJunkie::MeasurementsParser.new
  end
  
  def parse(string, *args)
    @parser.parse(string.downcase, *args)
  end

  it "should parse with or without a space" do
    parse("5 oz").should_not be_nil
    parse("5ounces").should_not be_nil
  end

  it "should parse integers" do
    parse("17").should_not be_nil
  end

  it "should parse floats" do
    parse("1.7").should_not be_nil
    parse(".5").should_not be_nil
  end

  it "should parse fractions" do
    parse("5/8").should_not be_nil
    parse("2 3/4").should_not be_nil
  end

  it "should parse distances" do
    parse("5 inches").should_not be_nil
    parse("2\"").should_not be_nil
  end

  it "should parse areas" do
    parse("3x10\"").should_not be_nil
    parse("2 by 5 feet").should_not be_nil
  end

  it "should parse compound units" do
    parse("3 6.5 ounce cans").should_not be_nil
  end

  it "should parse distance ranges" do
    parse("1-10inches").should_not be_nil
  end

  it "should parse volume ranges" do
    parse("6 to 7 cups").should_not be_nil
  end

  it "should parse portion volume" do
    parse("1 box").should_not be_nil
    parse("6 pieces").should_not be_nil
  end

  it "should parse non definitive measurements" do
    parse("1/2 batch", root: 'non_definitive_measurement').should_not be_nil
    parse("1 cupfuls", root: 'non_definitive_measurement').should_not be_nil
    parse("6 times", root: 'non_definitive_measurement').should_not be_nil
  end

end
