#Trying to read, modify and clone an array of strings

puts "enter an array of words and then press Enter"
first_array=gets.split
puts first_array.join ","

puts "==================================================================="
puts first_array.sort.join ","
puts "==================================================================="
puts first_array.sort_by { |elem| elem.size }.join ","

puts "==================================================================="
second_array=first_array
first_array.sort!
puts first_array.join ","
puts second_array.join ","

puts "==================================================================="
third_array=first_array.clone
first_array.reverse!
puts first_array.join ","
puts third_array.join ","

puts "==================================================================="
first_array.each &:upcase!
puts first_array.join ","
puts second_array.join ","
puts third_array.join ","
