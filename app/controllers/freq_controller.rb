class FreqController < ApplicationController
  def home
    @title = 'Token Frequencies'
    @freq = Freq.new
  end

  def freq
  end

end
