class Freq
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :input_text

  validates :input_text, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def tokens
    @input_text.split.map { |token| normalize(token) }
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
