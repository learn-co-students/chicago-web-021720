require_relative '../config/environment'

puts "hello world"

puts "wanna see some books?"

response = gets.chomp

if response == "yes" || response == "y"
  puts Book.all
end