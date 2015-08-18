puts "Please enter numbers separated by commas:"
numbers = gets.chomp
numbers = numbers.split(',').map { |n| n.to_i }
puts "Please enter your target number:"
target = gets.chomp.to_i




def countup(num_array, target)
  array_of_operations = ["+","-","/","*"]
  left_value = num_array.sample
  total_iterations = 0

  while true
    output = ""
    total_iterations += 1
    current_operation = array_of_operations.sample
    right_value = num_array.sample

    output = "#{left_value} #{current_operation} #{right_value} ="

    # avoid dividing by 0
    if right_value != 0
      left_value = left_value.send(current_operation, right_value)
    else
      left_value += right_value
    end

    puts "#{output} #{left_value}"

    return total_iterations if left_value == target
  end

end

puts countup(numbers, target)
