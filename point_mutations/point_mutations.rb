
class DNA
	def initialize(strand)
		@strand = strand.chars
	end

	def hamming_distance(distance)
		strand = @strand[0, distance.size]
		strand.zip(distance.chars).count {|item1, item2| item1 != item2}
	end
end

puts dna = DNA.new('GACTACGGACAGGGTAGGGAAT').hamming_distance('GACATCGCACACC')
