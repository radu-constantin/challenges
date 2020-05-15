class BeerSong
	def initialize
		@beer_song = {
			0 => "No more bottles of beer on the wall, no more bottles of beer.\n" \
	      "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
			1 => "1 bottle of beer on the wall, 1 bottle of beer.\n" \
	      "Take it down and pass it around, no more bottles of beer on the wall.\n",
			2 => "2 bottles of beer on the wall, 2 bottles of beer.\n" \
	      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
		}
		3.upto(99) do |num|
			@beer_song[num] = "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
	      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n" \
		end
	end

	def verse(verse_num)
		@beer_song[verse_num]
	end

	def verses(verse_num, to_verse_num)
		verses = ''
		min, max = [verse_num, to_verse_num].sort
		((min + 1)..max).to_a.reverse.each do |num|
			verses << @beer_song[num]
			verses << "\n"
		end
		verses + @beer_song[min]
	end

	def lyrics
		verses(99, 0)
	end
end

puts BeerSong.new.verses(99, 98)
