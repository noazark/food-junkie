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

    def measurement
      @syntax_node.measurement.to_s
    end

    def substance
      @syntax_node.substance.to_s
    end

    def to_s
      @syntax_node.to_s
    end
  end
end