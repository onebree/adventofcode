input = File.read('input')
up = input.count '('
down = input.count ')'
floor = up - down

puts "The instructions take santa to floor: #{floor}"
