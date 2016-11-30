surface_area = 0
input = File.read('input')
input.each_line do |line|
  dimensions = line.split('x').map(&:to_i)
  sides = dimensions.combination(2).map { |x| x.inject(:*) }
  slack = sides.min
  area = 2 * sides.inject(:+)
  surface_area += area + slack
end

puts "Total square feet of wrapping paper needed: #{surface_area}"
