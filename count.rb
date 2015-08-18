#Given a goal number and a list of other numbers, your program should use basic math to use the other numbers to arrive at the goal number! Good Luck!

#Get goal number from user
print "Enter Goal Number "
goal_number = gets.chomp.to_i
puts goal_number

#Get array numbers from user and convert to integers and sort array from smallest to largest
print "Enter Numbers separated by commas "
numbers = gets.chomp
numbers = numbers.split(',')
numbers_integers = numbers.sort.map{|n| n.to_i}
puts numbers_integers

#PROGRAM WILL USE FIRST NUMBERS TO EQUAL SECOND NUMBER USING BASIC MATH (*,/,+,-)

highest = numbers_integers.last
lowest = numbers_integers.first

#CHECK IF ANY OF THE NUBMERS ALREADY EQUAL THE GOAL NUMBER
if numbers_integers.any? {|n| n==goal_number}
  puts "Were done.  One of our numbers is already the goal number"
end

sum_number = 0
while sum_number != goal_number do
  numbers_integers.each do |n|

    if sum_number > goal_number
      sum_number -= n
    elsif sum_number < goal_number
      sum_number += n
    elsif sum_number == goal_number
      puts "Were done."
    end

    puts "Current number of array: #{n}"
    puts "Sum:  #{sum_number}"
  end
end
