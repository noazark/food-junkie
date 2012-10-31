module FoodJunkie
  module SyntaxNodes
    class Recipe < Base
      def steps
        children(Step)
      end

      def ingredients
        children(Ingredient)
      end

      def times
        children(Time)
      end
    end
  end
end