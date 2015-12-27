input = File.read('input').lines.map(&:strip)
chars = input.map { |line| line.inspect.length - line.length }.inject(:+)
puts "Difference of characters between encoded and literal strings: #{chars}"
