input = File.read('input')
floor = 0
input.chars.each_with_index do |char, i|
  floor += 1 if char == '('
  floor -= 1 if char == ')'
  @basement_move ||= i + 1 if floor < 0
end

describe "Elevator" do
  examples = {
    ")"     => 1,
    "()())" => 5
  }

  it "works" do
    examples.each do |input, floor|
      elevator(input).must_equal floor
    end
  end
end

puts "Santa enters the basement on move: #{@basement_move}"
