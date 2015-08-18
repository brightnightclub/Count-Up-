require 'colorize'

puts "Hi I'm #{'Brute'.colorize(:light_red)}! I mostly just count things but someday Jonan will teach me how to love!"
puts
puts "Give me a bunch of numbers separated by some non-numbers! (e.g. #{'\'1fish2fish3fishbluefish\''.colorize(:light_blue)})"
@numbers = gets.split(/\D+/).reject(&:empty?).map(&:to_i)
puts "How high should I count? (no fish!)"
@goal = gets.chomp.to_i
puts

@total = 0

def run
  count = 0

  while @total != @goal do
    number, operation = best_option

    print "I did #{@total.to_s.colorize(:light_blue)} #{operation.to_s.colorize(:light_magenta)} #{number.to_s.colorize(:light_blue)} to get my new total of "
    @total = eval("#{@total}#{operation}#{number}")
    print "#{@total.to_s.colorize(:light_yellow)}\n"

    count += 1
  end

  puts

  count
end

def best_option
  closest = @goal
  best_number = nil
  best_operation = nil

  @numbers.each do |number|
    options = get_options(number)

    options.each_pair do |operation, result|
      puts "I could have tried #{@total} #{operation} #{number} to get #{result}" if ENV['DEBUG']
      # 15 - 75 (60)
      # 20 - 75 (55)
      # 40 - 75 (35)
      # 80 - 75 (5)

      absolute_difference = (result.abs - @goal.abs).abs

      if absolute_difference < closest
        best_number = number
        best_operation = operation
        closest = absolute_difference
      end
    end
  end

  [best_number, best_operation]
end

def get_options(number)
  options = {}

  options['+'] = @total + number
  options['-'] = @total - number
  options['*'] = @total * number

  if @total % number == 0 && number != 0
      options['/'] = @total / number
  end

  options
end

puts "#{'I did it! I counted to '.colorize(:light_green) + @goal.to_s.colorize(:light_green) + ' and it only took me '.colorize(:light_green) + run.to_s.colorize(:light_yellow) + ' tries!'.colorize(:light_green)}"
