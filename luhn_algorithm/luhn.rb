class Luhn
	def initialize(number)
		@number = number
	end

	def addends
		@number.digits.map.with_index do |digit, index|
			if index.odd? && digit >= 5
				(digit * 2) - 9
			elsif index.odd?
			  digit * 2
			else
				digit
			end
		end.reverse
	end

	def checksum
		self.addends.reduce(:+)
	end

	def valid?
		self.checksum.digits[0] == 0
	end

	def self.create(number)
		checksum = self.new(number * 10).checksum.digits[0]
		if checksum == 0
			num_to_add = 0
		else
			num_to_add = 10 - checksum
		end
		"#{number}#{num_to_add}".to_i
	end
end
