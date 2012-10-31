module FoodJunkie
  class Ingredient
    def initialize(ingredient)
      case ingredient
      when String
        @syntax_node = Parsers::IngredientParser.new.parse ingredient
      when FoodJunkie::SyntaxNodes::Ingredient
        @syntax_node = ingredient
      end
    end

    attr_reader :syntax_node
  end
end