module FoodJunkie
  class Parser

    # Load the Treetop grammar, and create a new instance
    # of that parser as a class variable so we don't have to
    # re-create it every time we need to parse a string
    @@parser = Parsers::RecipesParser.new
    
    def self.parse(data)
      tree = @@parser.parse(data.downcase)
      
      if(tree.nil?)
        raise Exception, "Parse error at offset: #{@@parser.index}"
      end
      
      # clean up the tree by removing all nodes of default type 'SyntaxNode'
      #self.clean_tree(tree)
      
      return tree
    end

  private

    def self.clean_tree(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "FoodJunkie::SyntaxNode" }
      root_node.elements.each {|node| self.clean_tree(node) }
    end

  end
end
