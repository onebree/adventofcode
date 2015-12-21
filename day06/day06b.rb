def parse_instructions(input)
  data = input.scan(/([a-z ]+) (\d+),(\d+) through (\d+),(\d+)/).flatten.map { |x| x[/\d/] ? x.to_i : x }
  action, start, finish = data[0], data[1,2], data[3,4]
end

def change_brightness(light, action)
  if action == 'turn off' && light > 0
    -1
  elsif action == 'turn on'
    1
  elsif action == 'toggle'
    2
  else 0
  end
end

def change_display(input)
  input.each_line do |line|
    action, start, finish = parse_instructions(line)
    (start[0]..finish[0]).each do |x|
      (start[1]..finish[1]).each do |y|
        light = @lights[x][y] 
        light += change_brightness(light, action)
      end
    end
  end
end

@lights = Array.new(1000) { Array.new(1000, 0) }
input = File.read('input')
change_display(input)
puts "Total brightness of all lights: #{@lights.flatten.inject(:+)}"
