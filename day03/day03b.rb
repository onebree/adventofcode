def directions(santa)
  input = File.read('input').strip
  input.chars.select.with_index { |x, i| i.send(santa) }
end

def compute_position(move)
  x, y = 0, 0
  case move
  when '^' then y += 1
  when '>' then x += 1
  when 'v' then y -= 1
  when '<' then x -= 1
  end
  return x, y
end

def map_deliveries(santa)
  deliveries = [ [0, 0] ]
  directions(santa).each do |move|
    previous = deliveries.last
    x, y = compute_position(move)
    a, b = deliveries.last
    deliveries.push [a + x, b + y]
  end
  deliveries
end

def calculate_houses
  santa = map_deliveries(:even?)
  robo_santa = map_deliveries(:odd?)
  (santa + robo_santa).uniq.length
end

puts "Houses that receive at least one present: #{calculate_houses}"
