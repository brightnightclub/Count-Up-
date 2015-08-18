require_relative 'classes'

def add_one(number)
  print "(#{number}/#{number}) + "
  number/number
end

goalz = Goalz.get_number

list = Lizt.get_list

puts "Your goal is: #{goalz.print_goalz} and your list is: #{list.print_list}."


puts "To reach your goal of #{goalz.goalz}"

array = list.list
array.delete(0)
num = array[0]
climber = 0
until climber == goalz.goalz - 1
  climber += add_one(num)
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
