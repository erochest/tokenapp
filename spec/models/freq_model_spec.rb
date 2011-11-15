require 'spec_helper'

describe FreqModel do
  describe "tokens" do
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

  describe "freqs" do
    before(:each) do
      fm = FreqModel.new('The quick brown fox jumped over the lazy dog.')
      @freqs = fm.freqs
    end

    it 'should correctly count the tokens.' do
      freqs = @freqs.to_a.sort
      freqs.should == [
        ["brown", 1],
        ["dog", 1],
        ["fox", 1],
        ["jumped", 1],
        ["lazy", 1],
        ["over", 1],
        ["quick", 1],
        ["the", 2],
      ]
    end
  end
end

