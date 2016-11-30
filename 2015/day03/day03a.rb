x, y = 0, 0
moves = [ [x, y] ]
input = File.read('input')

input.chars.each do |move|
  case move
  when '^' then y += 1
  when '>' then x += 1
  when 'v' then y -= 1
  when '<' then x -= 1
  end
  moves.push [x, y]
end

houses = moves.uniq.size

puts "Houses that receive at least one present: #{houses}"
