module FoodJunkie
  module SyntaxNode
    class Time < Base
      def to_i
        text_value.to_unit.to_base.scalar
      end
    end
  end
end