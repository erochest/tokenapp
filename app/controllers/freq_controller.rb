class FreqController < ApplicationController
  def home
    @title = 'Token Frequencies'
    @freq = FreqModel.new
  end

  def freq
  end

end
