module FoodJunkie
  class Step
    def initialize(step)
      case step
      when String
        @syntax_node = Parsers::RecipeParser.new.parse(step).steps.first
      when FoodJunkie::SyntaxNodes::Step
        @syntax_node = step
      end
    end

    attr_reader :syntax_node

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