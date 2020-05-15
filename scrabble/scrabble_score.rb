class Scrabble
	def initialize(word)
		@word = word
	end

	def score
		return 0 if @word == nil
		score = 0
		@word.chars.each do |char|
			score += letter_value(char)
		end
		score
	end

	def self.score(word)
		self.new(word).score
	end

	def letter_value(letter)
		case
			when letter.match(/[aeioulnrst]/i)
				1
			when letter.match(/[dg]/i)
				2
			when letter.match(/[bcmp]/i)
				3
			when letter.match(/[fhvwy]/i)
				4
			when letter.match(/[k]/i)
				5
			when letter.match(/[jx]/i)
				8
			when letter.match(/[qz]/i)
				10
			when letter.match(/[^a-z]/i)
				0
			end
	end
end


puts Scrabble.new('a').score
