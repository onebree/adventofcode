wires = { }
input = File.read('input').each_line.map(&:strip)

until wires.length == input.length
  input.each do |line|
    operator = line[/[A-Z]+/]
    operands = line.scan(/[a-z\d]+/)[0...-1].map do |x|
      if x[/\d+/]
        x.to_i
      elsif wires[x]
        wires[x]
      else
        'empty'
      end
    end
    destination = line.scan(/[a-z\d]+/).last

    unless operands.include? 'empty'
      wires[destination] = 
        case operator
        when 'NOT'
          ~ operands[0]
        when 'AND'
          operands.inject(:&)
        when 'OR'
          operands.inject(:|)
        when 'RSHIFT'
          operands.inject(:>>)
        when 'LSHIFT'
          operands.inject(:<<)
        else
          operands[0]
      end
    end
  end
end

puts "Signal to wire a: #{wires['a']}"
