require 'spec_helper'

describe FoodJunkie::SyntaxNodes::Base do

  subject do
    FoodJunkie::SyntaxNodes::Base.new('hello', 0)
  end

  describe "#children" do

    subject do
      FoodJunkie::SyntaxNodes::Base.new('world', 0, [
        FoodJunkie::SyntaxNodes::Base.new('foo', 0, [
          FoodJunkie::SyntaxNodes::Base.new('bar', 0),
          Treetop::Runtime::SyntaxNode.new('pants', 0)
        ]),
        Treetop::Runtime::SyntaxNode.new('foo', 0),
        Treetop::Runtime::SyntaxNode.new('bar', 0)
      ])
    end
    
    it "returns all nested children matching `klass`" do
      subject.elements.count.should eq 3
      subject.children(FoodJunkie::SyntaxNodes::Base).count.should eq 3
    end

  end

end