puts "Please enter numbers separated by commas:"
numbers = gets.chomp
numbers = numbers.split(',').map { |n| n.to_i }
puts "Please enter your target number:"
target = gets.chomp.to_i




def countup(num_array, target)
  array_of_operations = ["+","-","/","*"]
  current_num = num_array.sample

  until current_num == target
    current_operation = array_of_operations.sample
    if current_num != 0
      current_num = num_array.sample.send(current_operation, current_num)
    else
      current_num += num_array.sample
    end
    puts current_num
    return true if current_num == target
  end

end

puts countup(numbers, target)
