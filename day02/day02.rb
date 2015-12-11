def dimensions(str)
  str.split('x').map(&:to_i)
end

def wrapping_paper_area(input)
  surface_area = 0
  input.each_line do |line|
    sides = dimensions(line).combination(2).map { |x| x.inject(:*) }
    area = 2 * sides.inject(:*)
    slack = sides.min
    surface_area += area + slack
  end
  surface_area
end

def ribbon_length(input)
  length = 0
  input.each_line do |line|
    perimeter = 2 * dimensions(line).sort[0..1].inject(:+)
    bowtie = dim.inject(:*)
    length += perimeter + bowtie
  end
  length
end

puts "Total square feet of wrapping paper needed: #{wrapping_paper_area(input)}"
puts "Total feet of ribbon needed: #{ribbon_length(input)}"
