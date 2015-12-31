def look_and_say(string, iterations)
  iterations.times do
    string = string.chars.slice_when { |x,y| x != y }.map { |x| "#{x.count}#{x[0]}" }.join
  end
  string
end

input = File.read('input').strip

# PART ONE
sequence_40 = look_and_say(input, 40)
puts "Look-and-say string length after 40 iterations: #{sequence_40.length}"

# PART TWO
sequence_50 = look_and_say(sequence_40, 10)
puts "Look-and-say string length after 50 iterations: #{sequence_50.length}"
