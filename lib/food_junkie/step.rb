module FoodJunkie
  class Step
    def initialize(step)
      case step
      when String
        @syntax_node = Parsers::StepsParser.new.parse step
      when FoodJunkie::SyntaxNodes::Step
        @syntax_node = step
      end
    end
  end
end