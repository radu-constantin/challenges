def reverse_odd_words(string)
	string.scan(/[a-z]{1,20}/i).map.with_index do |word, index|
		index.odd? ? word.reverse : word
	end.join(' ') + '.'
end

=begin
test = 'whats the  matter with  kansas'
puts reverse_odd_words(test)
=end
