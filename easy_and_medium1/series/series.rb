class Series
	def initialize(input)
		@input = input.chars.map(&:to_i)
	end

	def slices(n)
		raise ArgumentError if n > @input.size
		slices = []
		@input.each_cons(n) {|cons| slices << cons}
		slices
	end
end
