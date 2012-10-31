module FoodJunkie
  class Ingredient
    def initialize(ingredient)
      case ingredient
      when String
        @syntax_node = Parsers::StepsParser.new.parse ingredient
      when FoodJunkie::SyntaxNodes::Ingredient
        @syntax_node = ingredient
      end
    end
  end
end