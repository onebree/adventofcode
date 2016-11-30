def follows_format?(password)
  password[/\A[a-hjkmnp-z]{8}\z/]
end

def straight_letters?(password)
  password.chars.each_cons(3).any? { |x| x[0].next == x[1] && x[1].next == x[2] }
end

def two_letter_pairs?(password)
  password.scan(/(.)\1/).flatten.uniq.length > 1
end

def valid_password?(password)
  follows_format?(password) && straight_letters?(password) && two_letter_pairs?(password)
end

def next_password(password)
  (password.next...'zzzzzzzz').each { |pw| return pw if valid_password?(pw) }
end

input = File.read('input').strip

# PART ONE
first_password = next_password(input)
puts "First viable password for Santa: #{first_password}"

# PART TWO
second_password = next_password(first_password)
puts "Second viable password for Santa: #{second_password}"
