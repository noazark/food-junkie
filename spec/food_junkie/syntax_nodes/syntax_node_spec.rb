require 'spec_helper'

describe FoodJunkie::SyntaxNode do

  subject do
    FoodJunkie::SyntaxNode.new('hello', 0)
  end

  describe "#children" do

    subject do
      FoodJunkie::SyntaxNode.new('world', 0, [
        FoodJunkie::SyntaxNode.new('foo', 0, [
          FoodJunkie::SyntaxNode.new('bar', 0),
          Treetop::Runtime::SyntaxNode.new('pants', 0)
        ]),
        Treetop::Runtime::SyntaxNode.new('foo', 0),
        Treetop::Runtime::SyntaxNode.new('bar', 0)
      ])
    end
    
    it "returns all nested children matching `klass`" do
      subject.elements.count.should eq 3
      subject.children(FoodJunkie::SyntaxNode).count.should eq 3
    end

  end

end