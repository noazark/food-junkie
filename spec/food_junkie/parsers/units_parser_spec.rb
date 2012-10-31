require 'spec_helper'

describe FoodJunkie::Parsers::UnitsParser do
  before :all do
    @parser = FoodJunkie::Parsers::UnitsParser.new
  end
  
  def parse(string, *args)
    @parser.parse(string, *args)
  end

  forms = %w(
    years year
    months month
    weeks week
    days day
    hours hour hr
    minutes minute min
    seconds second sec

    tablespoons tablespoon tbsp
    teaspoons teaspoon tsp
    grams gram g
    ounces ounce oz
    pounds pound lbs lb
    cups cup c
    pints pint pt
    quarts quart qt
    gallons gallon gal

    pinches pinch pn
    smidgens smidgen

    degrees degree deg
    fahrenheit F
    celcius C

    feet foot ft '
    inches inch " in
    meters meter
    centimeters centimeter cm
    millimeters millimeter mm

    boxes box
    cans can
    containers container
    pods pod
    rolls roll
    slices slice
    pieces piece
  )

  non_definitive_forms = %w(
    batches batch
    times time
    cupfuls cupful
    equals equal
  )

  serving_forms = %w(
    helpings helping
    portions portion
    servings serving
  )

  forms.each do |form|
    it "should parse #{form}" do
      parse(form).should_not be_nil
    end
  end

  non_definitive_forms.each do |form|
    it "should parse #{form}" do
      parse(form, root: 'non_definitive_unit').should_not be_nil
    end
  end

  serving_forms.each do |form|
    it "should parse #{form}" do
      parse(form, root: 'serving_unit').should_not be_nil
    end
  end

end
