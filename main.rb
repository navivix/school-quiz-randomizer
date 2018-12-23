# This script was made to randomly choose a number of students
# who will be quized during a class.

puts '=================================='
puts '+         Welcome to SQR         +'
puts '+   Please provide information   +'
puts '=================================='

print 'Number of students: '
number_of_students = gets.chomp.to_i # save the number of students

print 'Number of students to quiz: '
number_to_quiz = gets.chomp.to_i # save the number of students to quiz

print 'Students that are excluded (e.g. 1, 6, 10): '
input = gets.chomp # save the numbers of students that are excluded

# Input conversion
input.gsub!(/\D/, ' ')       # replace non-numeric values with whitespace
input.strip!                 # remove trailing whitespace
input.squeeze!(' ')          # remove excess whitespace between ints
excluded = input.split(' ')  # split ints between whitespace to an array
excluded.uniq!               # remove duplicate values
excluded.map!(&:to_i)        # convert array items to Integers

students = []
chosen = []

# make an array of students that might be quized
(1..number_of_students).each { |i| students << i unless excluded.include?(i) }

# choose number_to_quiz random students
while chosen.length < number_to_quiz
  x = students.sample                   # take a random student number
  chosen << x unless chosen.include?(x) # add it to chosen unless it's there
end

# print out the result                [x, y] => 'x, y'
puts "Students chosen to be quized: #{chosen.join(', ')}"
