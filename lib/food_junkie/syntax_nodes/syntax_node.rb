module FoodJunkie
  class SyntaxNode < Treetop::Runtime::SyntaxNode

    def children(klass)
      @children ||= {}

      unless @children[klass]
        found = []
        if nonterminal?
          self.elements.each do |el|
            results = el.children(klass) rescue []
            found += results if results.length > 0
          end
        end

        found << self if self.class.name == klass.name.to_s
      end

      return @children[klass] ||= found
    end

    def to_i
      text_value.to_i
    end

    def to_s
      text_value.to_s
    end

  end
end
