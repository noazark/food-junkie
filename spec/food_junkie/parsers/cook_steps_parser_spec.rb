require 'spec_helper'

module FoodJunkie
  class CookStep; end
  class Temperature; end
  class Time; end
end

describe FoodJunkie::CookStepsParser do
  before :all do
    @parser = FoodJunkie::CookStepsParser.new
  end
  
  def parse(string)
    @parser.parse(string)
  end

  forms = [
    "450 degrees for 30 min",
    "preheat oven to 450 degrees",
    "heat the oven to 425 degrees F",
    "bake at 350 degrees for 10 minutes",
    "4x5 inch pan",
    "twenty servings",
    "2 portions",
    "5 helpings",
    "one helping",
    "makes eighteen",
    "makes 1 portion"
  ]

  forms.each do |form|
    it "should parse #{form}" do
      parse(form).should_not be_nil
    end
  end

end
