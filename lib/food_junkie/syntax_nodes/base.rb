module FoodJunkie
  module SyntaxNodes
    class Base < Treetop::Runtime::SyntaxNode

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

          found << self if self.class == klass
        end

        return @children[klass] ||= found
      end

      def to_i
        text_value.to_i
      end

      def to_s
        text_value.to_s
      end

      def clean!
        return if(self.elements.nil?)
        self.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
        self.elements.each {|node| node.clean!}
      end

    end
  end
end
