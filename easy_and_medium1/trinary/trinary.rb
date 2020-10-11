class Trinary
	def initialize(input)
		@num = valid_input?(input) ? input.to_i.digits : [0]
	end

	def valid_input?(string)
		string == string.to_i.to_s 
	end

	def to_decimal
		trinary_num = 0
		@num.each_with_index do |digit, index|
			trinary_num += digit * (3**index)
		end
		trinary_num
	end
end


puts Trinary.new('102012').to_decimal
