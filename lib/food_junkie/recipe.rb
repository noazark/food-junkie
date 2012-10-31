module FoodJunkie
  class Recipe
    def initialize(recipe)
      case recipe
      when String
        @syntax_node = Parsers::RecipesParser.new.parse recipe
      when FoodJunkie::SyntaxNodes::Recipe
        @syntax_node = recipe
      end
    end

    attr_reader :syntax_node

    def steps
      syntax_node.steps.map do |step|
        FoodJunkie::Step.new step
      end
    end

    def ingredients
      syntax_node.ingredients.map do |ingredient|
        FoodJunkie::Ingredient.new ingredient
      end
    end

    def total_time
      syntax_node.times.inject 0 do |total, time|
        total += time.to_i
      end
    end
  end
end