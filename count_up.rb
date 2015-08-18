class CountUp
  def self.generate_solutions(input_number, usable_numbers)
    if input_number == 0
      return 0
    end

    usable_numbers.each { |elem|
      total = input_number
      plus_count = 1
      loop do
        total = total - elem
        if total >= elem
          plus_count += 1
        elsif total < 0
          break
        elsif total == 0
          return makes_string(plus_count, elem)
        end
      end
    }
  end

  def self.generate_solutions_2_point_0(input_number, usable_numbers)
    usable_numbers.each {|num| usable_numbers << -num }
    diffs = usable_numbers.map {|num| input_number - num }
    i = diffs.index_of(diffs.min)
    sum = usable_numbers[i]

    diffs = usable_numbers.map {|num| input_number - (sum + num) }
    next_num = usable_numbers[diffs.index_of(diffs.min)]
    sum += next_num
  end

  def self.makes_string(count, number)
    output_string = "#{number}"
    (count-1).times {
      output_string += " + #{number}"
    }
    output_string
  end
end
