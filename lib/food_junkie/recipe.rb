module FoodJunkie
  class Recipe
    def initialize(recipe_string)
      @parser = Parsers::RecipesParser.new.parse recipe_string
    end

    def steps
      @parser.children(FoodJunkie::SyntaxNodes::Step)
    end

    def ingredients
      @parser.children(FoodJunkie::SyntaxNodes::Ingredients)
    end

    def total_time
      times = @parser.children(FoodJunkie::SyntaxNodes::Time)

      times.inject 0 do |total, time|
        total += time.to_i
      end
    end
  end
end