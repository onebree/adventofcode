def split_duplicates?(string)
  string.each_char { |x| return true if string[/#{x}.#{x}/] }
  return false
end

def double_pairs?(string)
  count = 0
  string.chars.each_with_index do |x, i|
    pair = string[i..i.next]
    return true if string.scan("#{pair}").length > 1
  end
  return false
end

def nice_string?(str)
  split_duplicates?(str) && double_pairs?(str)
end

def find_nice_strings
  input = File.read('input').strip
  input.lines.count { |line| nice_string?(line) }
end

puts "Total nice strings: #{find_nice_strings}"
