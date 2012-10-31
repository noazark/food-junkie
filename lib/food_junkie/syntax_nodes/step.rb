module FoodJunkie
  module SyntaxNodes
    class Step < Base
      def ingredients
        children(Ingredient)
      end

      def times
        children(Time)
      end
    end
  end
end