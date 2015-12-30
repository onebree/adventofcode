def find_difference(arr1, arr2)
  [arr1, arr2].map { |x| x.inject(:+) }.inject(:-)
end

input = File.read('input').lines.map(&:strip)
line_lengths, eval_lengths, inspect_lengths = [], [], []

input.each do |line|
  line_lengths.push line.length
  eval_lengths.push eval(line).length
  inspect_lengths.push line.inspect.length
end

# PART ONE
literal_memory = find_difference(line_lengths, eval_lengths)
puts "Difference of characters between literals and memory values: #{literal_memory}"

# PART TWP
encoded_literals = find_difference(inspect_lengths, line_lengths)
puts "Difference of characters between encoded and literal strings: #{encoded_literals}"
