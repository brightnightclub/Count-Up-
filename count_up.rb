require 'pry'
# Step 1: Run your test algo to see if your current toolbox gets to your target num
# Step 2: Generate new numbs for toolbox
# Step 3: Repeat


def compare (target, inputs)
  inputs.each_with_index do |input, index|
    if inputs.length > index +1
      next_number = inputs[index + 1]
      return [input, next_number] if input + next_number == target
      return [input, next_number] if input - next_number == target
      return [input, next_number] if next_number - input == target
      return [input, next_number] if next_number * input == target
      return [input, next_number] if next_number / input == target
      return [input, next_number] if input / next_number == target
    end
  end
  return false
end

def generator (inputs, registry)

  new_inputs = inputs.dup

  inputs.each_with_index do |input, index|
    if inputs.length > index +1
      plus_number = inputs[index + 1] + input
      minus_number = inputs[index + 1] - input

      if !new_inputs.include?(plus_number)
        new_inputs.push(plus_number)
        registry[plus_number] = [inputs[index + 1], input]
      end

      if !new_inputs.include?(minus_number) && minus_number > 0
        new_inputs.push(minus_number)
      end
    end
  end
  new_inputs
end


input_numbers = [2, 7, 9, 3]
target = 75
counter = 0
registry = {}


while (!matches = compare(target, input_numbers)) && counter < 10 do
  input_numbers = generator(input_numbers, registry)
  counter += 1
end

puts "there we go! : #{matches}"
puts registry

def find_parents(int, input_numbers)
  
  if input_numbers.include?(int)
    int
  else
    registry[int].collect{|m| find_parents(m, input_numbers)}
  end
end

puts matches.collect{|m| find_parents(m, input_numbers)}
