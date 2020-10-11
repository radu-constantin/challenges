class SumOfMultiples
  attr_reader :multiple_of

  def initialize(*num_input)
    @multiple_of = num_input.empty? ? [5, 3] : num_input
  end

  def to(limit)
    self.class.to(limit)
  end

  def self.to(limit)
    @multiple_of = [5, 3]
    @range = 0...limit
    @range.select do |num|
       @multiple_of.any? {|item| num % item == 0}
    end.reduce(:+)
  end
end

SumOfMultiples.to (10000)
