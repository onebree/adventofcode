require "minitest/autorun"

def floor_reached(input)
  up = input.count '('
  down = input.count ')'
  up - down
end

describe "Elevator" do
  examples = {
    "(())"    => 0,
    "()()"    => 0,
    "((("     => 3,
    "(()(()(" => 3,
    "))(((((" => 3,
    "())"     => -1,
    "))("     => -1,
    ")))"     => -3,
    ")())())" => -3
  }

  it "works" do
    examples.each do |input, floor|
      elevator(input).must_equal floor
    end
  end
end

input = File.read('input')

floor = floor_reached(input)

puts "The instructions take santa to floor:", floor
