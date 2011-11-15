class FreqModel
  def initialize(input)
    @input = input
  end

  def tokens
    @input.split.map { |token| normalize(token) }
  end

  def normalize(token)
    token.gsub(/\W/, '').downcase
  end

  def freqs
    counts = Hash.new(0)
    tokens.each do |token|
      counts[token] += 1
    end
    counts
  end
end
