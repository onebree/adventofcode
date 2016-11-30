def find_operands(input)
  input.scan(/[a-z\d]+/).map { |x| x[/\d+/] ? x.to_i : @wires[x] }
end

def operands_defined?(operands)
  operands.none?(&:nil?)
end

def find_signal(operator, operands)
  if operator.nil?
    operands[0]
  elsif operands.length == 1
    ~ operands[0]
  else
    operands.inject(operator)
  end
end

def assign_wire_values(input)
  until @wires.length >= input.length
    input.each do |line|
      source, destination = line.split ' -> '
      operator = @bitwise[source[/[A-Z]+/]]
      operands = find_operands(source)
      next unless operands_defined?(operands)
      @wires[destination] = find_signal(operator, operands)
    end
  end
end

@wires = { }
@bitwise = { 'AND' => :&, 'OR' => :|, 'RSHIFT' => :>>, 'LSHIFT' => :<<, 'NOT' => :~ }
input = File.readlines('input').map(&:strip)

# PART ONE
assign_wire_values(input)
puts "Signal provided to wire a: #{@wires['a']}"

# PART TWO
@wires, @wires['b'] = { }, @wires['a']
input.reject! { |x| x.end_with?('-> b') }
assign_wire_values(input)
puts "New signal provided to wire a: #{@wires['a']}"
