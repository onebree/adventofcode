length = 0
input = File.read('input')
input.each_line do |line|
  dimensions = line.split('x').map(&:to_i)
  perimeter = 2 * dimensions.sort[0..1].inject(:+)
  bowtie = dimensions.inject(:*)
  length += perimeter + bowtie
end

puts "Total feet of ribbon needed: #{length}"
