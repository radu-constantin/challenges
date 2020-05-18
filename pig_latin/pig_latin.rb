class PigLatin
	def self.translate(words)
		words.split(' ').map do |word|
			if start_with_vowel?(word)
				word + 'ay'
			else
				consonants = '[]'
				word.chars.each do |char|
					if char.match(/[^aeiou]/)
						consonants << char
					elsif consonants.last == 'q' && char == 'u'
						consonants << char
					end
					break if char.match(/[aeiou]/)
				end
				word[consonants.size..-1] + consonants.join + 'ay'
			end
		end.join(' ')
	end

	def self.start_with_vowel?(word)
		word[0].match(/[aeiou]/) ||
		(word[0] == 'y' || word[0] == 'x') && word[1].match(/[^aeiou]/)
	end
end
