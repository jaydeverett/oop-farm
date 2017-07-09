class Farm

  def initialize(name)
    puts "Welcome to #{name}!"
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    print 'What would you like to do?'
    print '[1] > add a new field'
    print '[2] > harvest crops'
    print '[3] > check the status of a field'
    print '[4] > take a break and relax'
    print '[5] > exit the program'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then field
    when 2 then harvest
    when 3 then status
    when 4 then relax
    when 5 then main_menu = false
      puts "goodbye!"
    end
  end



end


class Corn

end


class Wheat

end
