def three_vowels?(string)
  string.scan(/[aieou]/).length > 2
end

def double_letters?(string)
  string.squeeze != string
end

def no_excluded_substrings?(string)
  %w( ab cd pq xy ).none? { |x| string.include? x }
end

def nice_string?(str)
  no_excluded_substrings?(str) && double_letters?(str) && three_vowels?(str)
end

def find_nice_strings
  input = File.read('input').strip
  nice_strings = []
  input.each_line.map { |x| x if nice_string?(x) }.compact.length
end

puts "Total nice strings: #{find_nice_strings}"
