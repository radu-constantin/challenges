require 'minitest/autorun'
require_relative 'odd_words_bonus.rb'

class OddWordsTest < Minitest::Test
	def test_normal_case
		string = "whats the  matter with     kansas   ."
		assert_equal('whats eht matter htiw kansas.', reverse_odd_words(string))
	end
end
