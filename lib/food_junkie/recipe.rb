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

    def syntax_node
      @syntax_node
    end

    def steps
      syntax_node.children(FoodJunkie::SyntaxNodes::Step)
    end

    def ingredients
      syntax_node.children(FoodJunkie::SyntaxNodes::Ingredient)
    end

    def total_time
      times = syntax_node.children(FoodJunkie::SyntaxNodes::Time)

      times.inject 0 do |total, time|
        total += time.to_i
      end
    end
  end
end