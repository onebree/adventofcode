input = File.read('input').lines.map(&:strip)
chars = input.map { |line| line.length - eval(line).length }.inject(:+)
puts "Difference of characters between literals and memory values: #{chars}"
