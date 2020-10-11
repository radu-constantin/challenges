module Romanized
	ROMAN_NUMERALS = {
		'M' => 1000,
		'CM' => 900,
		'D' => 500,
		'CD' => 400,
		'C' => 100,
		'XC' => 90,
		'L' => 50,
		'XL' => 40,
		'X' => 10,
		'IX' => 9,
		'V' => 5,
		'IV' => 4,
		'I' => 1
	}

	def to_roman
		arab_num = self
		roman_num = ''
		ROMAN_NUMERALS.each do |key, value|
			num_of_symbols, remainder = arab_num.divmod(value)
			roman_num << (key * num_of_symbols)
			arab_num = remainder
		end
		roman_num
	end
end

class Integer
	include Romanized
end
