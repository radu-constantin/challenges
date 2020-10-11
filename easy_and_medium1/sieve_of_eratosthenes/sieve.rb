class Sieve
	def initialize(max)
		@numbers = (2..max).to_a
	end

	def primes
		marked = []
		@numbers.each do |num|
			next if marked.include?(num)
				marked << @numbers.select {|n| n % num == 0}
			end
			marked.flatten.uniq
	end
end

puts Sieve.new(10).primes
