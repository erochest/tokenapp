class FreqController < ApplicationController
  def home
    @title = 'Token Frequencies'
    @freq = Freq.new
  end

  def freq
    @freq = Freq.new(params[:freq])
    if @freq.input_text.strip.length.zero?
      redirect_to root_url
    else
      @freq_a = @freq.freqs.to_a.sort_by! { |row| -row[1] }
    end
  end

end
