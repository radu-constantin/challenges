class SecretHandshake
	COMMANDS = {
		3 => 'jump',
		2 => 'close your eyes',
		1 => 'double blink',
		0 => 'wink'
	}

		def initialize(number)
			@binary_num = number.class == String ? number.to_i : number.to_s(2).to_i
		end

		def commands
			handshake = []
			max_index = 0
			@binary_num.digits.each_with_index do |digit, index|
					handshake << COMMANDS[index] if digit == 1 && index < 4
					max_index = index
			end
			max_index == 4 ? handshake.reverse : handshake
		end
end
