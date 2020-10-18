require 'pry'

class Palindromes
    attr_accessor :palindromes
    attr_reader :max_factor, :min_factor

    def initialize(factors = {})
        @max_factor = factors[:max_factor]
        @min_factor = factors[:min_factor] || 1
        @palindromes = Hash.new {|hash, key| hash[key] = []}
    end

    def palindrome?(number)
        number.to_s == number.to_s.reverse
    end

    def generate
        (min_factor..max_factor).to_a.repeated_combination(2) do |x, y|
            @palindromes[x * y] << [x, y] if palindrome?(x * y)
        end
    end

    def largest
       Struct.new(:value, :factors).new(palindromes.keys.max, palindromes[palindromes.keys.max])
    end

    def smallest
        Struct.new(:value, :factors).new(palindromes.keys.min, palindromes[palindromes.keys.min])
     end
end


