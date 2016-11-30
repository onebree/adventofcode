def parse_instructions(input)
  data = input.scan(/([a-z ]+) (\d+),(\d+) through (\d+),(\d+)/).flatten.map { |x| x[/\d/] ? x.to_i : x }
  action, start, finish = data[0], data[1,2], data[3,4]
end

def change_display(input)
  input.each_line do |line|
    action, start, finish = parse_instructions(line)
    (start[0]..finish[0]).each do |x|
      (start[1]..finish[1]).each do |y|
        @lights[x][y] = perform_action(@lights[x][y], action)
      end
    end
  end
end

def toggle(light)
  light.zero? ? 1 : 0
end

def perform_action(light, action)
  case action
  when 'turn off' then 0
  when 'turn on' then 1
  when 'toggle' then toggle(light)
  end
end

input = File.read('input').strip
@lights = Array.new(1000) { Array.new(1000, 0) }
change_display(input)
puts "Number of lights that are lit: #{@lights.flatten.count(1)}"
