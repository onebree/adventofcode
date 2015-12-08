input = File.read('input')
floor = 0
input.chars.each do |char|
  floor += 1 if char == '('
  floor -= 1 if char == ')'
end

puts "The instructions take santa to floor: #{floor}"
