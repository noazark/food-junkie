module FoodJunkie
  class Parser

    warn "[DEPRECATION] `FoodJunkie::Parser` will be removed with no replacement. Start using FoodJunkie::Recipe."

    # Load the Treetop grammar, and create a new instance
    # of that parser as a class variable so we don't have to
    # re-create it every time we need to parse a string
    @@parser = Parsers::RecipeParser.new
    
    def self.parse(data)
      tree = @@parser.parse(data.downcase)
      
      if(tree.nil?)
        raise Exception, "Parse error at offset: #{@@parser.index}"
      end
      
      # clean up the tree by removing all nodes of default type 'SyntaxNode'
      tree.clean!
      
      return tree
    end

  end
end
