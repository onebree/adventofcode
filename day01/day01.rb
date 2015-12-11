input = File.read('input')
floor = 0
input.chars.each_with_index do |char, i|
  floor += 1 if char == '('
  floor -= 1 if char == ')'
  @basement_move ||= i + 1 if floor < 0
end

puts "The instructions take santa to floor: #{floor}"
puts "Santa enters the basement on move: #{@basement_move}"
