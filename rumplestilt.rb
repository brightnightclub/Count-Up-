puts "Please enter numbers separated by commas:"
numbers = gets.chomp
numbers = numbers.split(',').map { |n| n.to_i }
puts "Please enter your target number under 10,000:"
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

    # get number close to zero

    if current_operation == "/" && left_value % right_value != 0
      output = "#{left_value} % #{right_value} ="
      left_value = left_value % right_value

    # avoid dividing by 0
    elsif right_value != 0
      left_value = left_value.send(current_operation, right_value)

    # and just add if divide by 0 was gonna happen
    else
      left_value += right_value
    end

    puts "#{output} #{left_value}"

    return total_iterations if left_value == target
  end

end

puts countup(numbers, target)
