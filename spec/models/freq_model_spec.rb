require 'spec_helper'

describe Freq do
  describe "tokens" do
    before(:each) do
      fm = Freq.new(:input_text => 'The quick brown fox jumped over the lazy dog.')
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

    it 'should throw out empty tokens.' do
      fm = Freq.new(:input_text => <<EOS
Four score and seven years ago our fathers brought forth on this continent, a
new nation, conceived in Liberty, and dedicated to the proposition that all men
are created equal.

Now we are engaged in a great civil war, testing whether that nation, or any
nation so conceived and so dedicated, can long endure. We are met on a great
battle-field of that war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives that that nation
might live. It is altogether fitting and proper that we should do this.

But, in a larger sense, we can not dedicate -- we can not consecrate -- we can
not hallow -- this ground. The brave men, living and dead, who struggled here,
have consecrated it, far above our poor power to add or detract. The world will
little note, nor long remember what we say here, but it can never forget what
they did here. It is for us the living, rather, to be dedicated here to the
unfinished work which they who fought here have thus far so nobly advanced. It
is rather for us to be here dedicated to the great task remaining before us --
that from these honored dead we take increased devotion to that cause for which
they gave the last full measure of devotion -- that we here highly resolve that
these dead shall not have died in vain -- that this nation, under God, shall
have a new birth of freedom -- and that government of the people, by the
people, for the people, shall not perish from the earth.
EOS
)
      fm.tokens.each do |token|
        token.should_not be_empty
      end
    end
  end

  describe "freqs" do
    before(:each) do
      fm = Freq.new(:input_text => 'The quick brown fox jumped over the lazy dog.')
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

