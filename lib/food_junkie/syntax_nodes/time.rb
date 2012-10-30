module FoodJunkie
  class Time < SyntaxNode
    def to_i
      text_value.to_unit.to_base.scalar
    end
  end
end