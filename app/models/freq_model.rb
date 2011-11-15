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
end
