class Goalz
  attr_accessor :goalz

  def initialize(goalz)
    @goalz = goalz
  end

  def self.get_number
    puts "Enter a goalz (a positive number):"

    goalz = gets.chomp.to_i

    if goalz.is_a?(Integer) && goalz != 0
      goalz = Goalz.new(goalz)
    else
      Goalz.get_number
    end
  end

  def print_goalz
    goalz
  end
end

class Lizt
  attr_accessor :list

  def initialize(list)
    @list = list
  end

  def self.get_list
    puts "Enter a list of numbers like so 1,2,3,4,5 "

    list = gets.chomp.split(',').map(&:to_i)

    if list.is_a?(Array) && !list.empty?
      Lizt.new(list)
    else
      Lizt.get_list
    end
  end

  def print_list
    list
  end
end
