require 'spec_helper'

describe FreqModel do
  describe "tokenizer" do
    before(:each) do
      fm = FreqModel.new('The quick brown fox jumped over the lazy dog.')
      @tokens = fm.tokens
    end

    it "should return the right number of tokens." do
      @tokens.length.should == 9
    end

    it "should remove whitespace from the tokens." do
      @tokens.each do |token|
        (/\s/ =~ token).should == nil
      end
    end

    it "should normalize the tokens." do
      @tokens.each do |token|
        (/[A-Z]/ =~ token).should == nil
      end
    end
  end
end

