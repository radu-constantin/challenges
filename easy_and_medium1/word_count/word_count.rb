class Phrase
	def initialize(string)
		@phrase = string
	end

	def word_count
		words = @phrase.downcase.scan(/\b[\w']+\b/)
		words.each_with_object({}) do |word, hash|
			hash.default = 0
			hash[word] += 1
		end
	end
end
