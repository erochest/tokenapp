class FreqController < ApplicationController
  def home
    @title = 'Token Frequencies'
    @freq = Freq.new
  end

  def freq
    @freq = Freq.new(params[:freq])
    if @freq.input_text.strip.length.zero?
      redirect_to root_url
    end
  end

end
