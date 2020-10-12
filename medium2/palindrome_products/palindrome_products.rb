class Palindromes
    attr_accessor :palindromes

    def initialize(factors = {})
        @max_factor = factors[:max_factor]
        @min_factor = factors[:min_factor] || 1
        @palindromes = []
    end

    def is_palindrome?(number)
        number.digits == number.digits.reverse
    end

    def generate
        range = (@min_factor..@max_factor).to_a
        current_index = 0
        until current_index == range.size - 1 do
            current_num = range[current_index]
            (range[current_index]..range[-1]).each do |num|
                product = current_num * num
                @palindromes << product if is_palindrome?(product) && !@palindromes.include?(product)
            end
            current_index += 1
        end
    end

    def largest
        largest = self.palindromes.max
        largest_palindrome = Palindromes.new(max_factor: @max_factor, min_factor: @min_factor)
        largest_palindrome.palindromes << largest
        largest_palindrome
    end

    def smallest
        smallest = self.palindromes.min
        smallest_palindrome = Palindromes.new(max_factor: @max_factor, min_factor: @min_factor)
        smallest_palindrome.palindromes << smallest
        smallest_palindrome
    end

    def value
        palindromes[0]
    end

    def factors
        number = palindromes[0]
        result = []
        range = (@min_factor..@max_factor).to_a
        current_index = 0
        until current_index == range.size - 1 do
            current_num = range[current_index]
            (range[current_index]..range[-1]).each do |num|
                result << [current_num, num] if current_num * num == number 
            end
            current_index += 1
        end
        result
    end
end

