require 'pry'

class WordProblem
    attr_reader :operation

    OPERATIONS = {
        'plus' => '+',
        'minus' => '-',
        'divided' => '/',
        'multiplied' => '*'
    }

    def initialize(string)
        @operation = string.scan(/-?[0-9]+|plus|minus|divided|multiplied/)
    end

    def answer
        raise ArgumentError if @operation.all? {|word| !OPERATIONS.include?(word)}

            result = operation[0].to_i.send OPERATIONS[operation[1]], operation[2].to_i 

            if operation.size > 3
                operation[3..-1].each_slice(2) do |x, y| 
                    result = result.send OPERATIONS[x], y.to_i
                end
            end
            result
    end
end
