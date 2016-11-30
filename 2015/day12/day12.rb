require 'json'

def json_sum(input)
  input.scan(/-?\d+/).map(&:to_i).inject(:+)
end

input = File.read('input')

# PART ONE
full_sum = json_sum(input)
puts "Sum of all numbers in document: #{full_sum}"

# PART TWO
