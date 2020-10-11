class PerfectNumber

	def self.classify(number)
		sum = divisor_sum(number)
		case
		when sum == number
			'perfect'
		when sum > number
			'abundant'
		when sum < number
			'deficient'
		end
	end

	def self.divisor_sum(number)
		raise RuntimeError if number < 0
		(1...number).select {|item| number % item == 0}.reduce(:+)
	end
end
irb
