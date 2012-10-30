require 'spec_helper'

describe FoodJunkie::PrimitivesParser do
  before :all do
    @parser = FoodJunkie::PrimitivesParser.new
  end
  
  def parse(string, *args)
    @parser.parse(string, *args)
  end

  forms = [
    # integers
    '1', '+495', '-495',
    # floats
    '1.4', '.595', '+393.5', '-2.59595',
    # fractions
    '1/5', '1 4/4', '-393/5', '+4/4',

    # strings
    'hello', 'world', 'medium-low', 'sweet\'n\'sour',

    # articles
    'the', 'a', 'an',

    # punctuation
    '.', '!', '?', ',', ':', ';', '\'', '"', '(', ')'
  ]

  number_forms = [
    # alphabetic numbers
    'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
    'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
    'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty', 'twenty-one',
    'twenty-two', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty',
    'ninety', 'one-hundred', 'two-thousand',
    'seven hundred ninety-two thousand eight-hundred fifty one'
  ]

  forms.each do |form|
    it "should parse #{form}" do
      parse(form).should_not be_nil
    end
  end

  number_forms.each do |form|
    it "should parse #{form}" do
      parse(form, root: 'number').should_not be_nil
    end
  end

  it "should parse a space" do
    parse(' ').should_not be_nil
  end

  it "should parse a new line" do
    parse('
    ').should_not be_nil
  end

end
