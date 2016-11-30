require 'digest'

def md5_hex(input, value)
  Digest::MD5.hexdigest("#{input}#{value}")
end

def first_num(input, z)
  (1..Float::INFINITY).find { |x| md5_hex(input, x)[0...z] == '0' * z }
end

input = File.read('input').strip
puts "First number to generate an md5 hash with 5 leading zeroes: #{first_num(input, 5)}"
puts "First number to generate an md5 hash with 6 leading zeroes: #{first_num(input, 6)}"
