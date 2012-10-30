require 'spec_helper'

describe FoodJunkie::RecipesParser do
  before :all do
    @parser = FoodJunkie::RecipesParser.new

    @recipe = "Preheat oven to 350 degrees. Lightly grease a baking dish.
      
      Bring a large pot of lightly salted water to a boil. Cook spaghetti in boiling water, stirring occasionally until cooked through but firm to the bite, about 12 minutes. Drain.
      
      Heat a large skillet over medium heat; cook and stir beef and onion until meat is browned and onions are soft and translucent, about 7 minutes. Drain. Stir in spaghetti sauce and seasoned salt.
      
      Whisk 2 eggs, 6oz of Parmesan cheese, and 1 tbsp of butter in a large bowl. Mix in spaghetti to egg mixture and toss to coat. Place half the spaghetti mixture into baking dish. Top with half the cottage cheese, mozzarella, and meat sauce. Repeat layers. Cover with aluminum foil.
      
      Bake in preheated oven for 40 minutes. Remove foil and continue to bake until the cheese is melted and lightly browned, 20 to 25 minutes longer."

    @step = "Preheat oven to 350 deg, then add 10 boxes of spaghetti, 4 cupfuls, 100 times, 3 tablespoons, seventeen carrots and 3tbsp of oil to the 9x12 inch pan. Bake for 3 hours. Makes three portions"
  end
  
  def parse(string, *args)
    @parser.parse(string.downcase, *args)
  end

  it "should parse a recipe" do
    parse(@recipe).should_not be_nil
  end

  it "should break a recipe into paragraphs" do
    parse(@recipe).elements.count do |el|
      el.class == FoodJunkie::Paragraph
    end.should eq 5
  end

  it "should find all the cook steps in a step" do
    parse(@step, root: 'step').elements.count do |el|
      el.class == FoodJunkie::CookStep
    end.should eq 1
  end

  it "should find all the ingredients in a step" do
    parse(@step, root: 'step').elements.count do |el|
      el.class == FoodJunkie::Ingredient
    end.should eq 3
  end

end
