require_relative 'classes'

def add_one(number, color_code)
  print "\e[#{color_code}m (#{number}/#{number})  \e[0m + "
  number/number
end

def color_code
 [31,32,33,34,35,36].sample
end

#
# def color(index)
#   normal = "\e[#{index}m#{index}\e[0m"
#   bold = "\e[#{index}m\e[1m#{index}\e[0m"
#   "#{normal}  #{bold}  "
# end
#
# 8.times do|index|
#   line = color(index + 1)
#   line += color(index + 30)
#   line += color(index + 90)
#   line += color(index + 40)
#   line += color(index + 100)
#   puts line
# end

goalz = Goalz.get_number

list = Lizt.get_list

puts "Your goal is: #{goalz.print_goalz} and your list is: #{list.print_list}."


puts "To reach your goal of #{goalz.goalz}"

array = list.list
array.delete(0)
num = array[0]
climber = 0
until climber == goalz.goalz - 1
  climber += add_one(num, color_code)
  num = array.shuffle[0]
end
print "(#{num}/#{num}) = #{goalz.goalz}"
puts ""
# list.list.each do |num|
#   next if num == 0
#
#   if goalz.goalz > num
#     # #goalz.goalz.divmod(num)
#     # div, mod = goalz.goalz.divmod(num)
#     #
#     # if mod == 0
#     #   #num * div = goalz
#     #   puts "To reach your goal of #{goalz.goalz}"
#     #   print "#{num} "
#     #   (div - 1).times do
#     #     print "+ #{num}"
#     #   end
#     # end
#   end
#
#     #   goal - (num * div) + ((num/num) * mod)
#     # end
# end
