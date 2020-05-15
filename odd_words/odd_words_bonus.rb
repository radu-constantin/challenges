

def reverse_odd_words(string)
  output = ''
  word_counter = 0
  to_be_reversed = ''
  previous_char = ''
  string_size = string.scan(/[a-z]{1,20}/i).size
  string.chars.each do |char|
    next if (previous_char == ' ' && char == ' ')
    if word_counter == string_size - 1 && (previous_char.match(/[a-z]/i) && char == ' ')
      output << '.'
      break
    elsif char == ' '
      output << to_be_reversed.reverse
      to_be_reversed = ''
      word_counter += 1
      output << char
    elsif word_counter.odd? && char != ' '
     to_be_reversed << char
    else
      output << char
    end
    previous_char = char
  end
  output
end

string = "hello word"
puts reverse_odd_words(string)
