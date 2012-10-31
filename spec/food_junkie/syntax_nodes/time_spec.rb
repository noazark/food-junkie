require 'spec_helper'

describe FoodJunkie::SyntaxNode::Time do

  describe "#to_i" do

    it "converts match to integer" do
      subject = FoodJunkie::SyntaxNode::Time.new("31 minutes", 0..9)
      subject.to_i.should eq(31 * 60)
    end
    
    it "converts floating-point match to integer" do
      subject = FoodJunkie::SyntaxNode::Time.new("1.4 hours", 0..999999)
      subject.to_i.should eq(1.4 * 3600)
    end

  end

end