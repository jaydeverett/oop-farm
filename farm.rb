require 'pry'

class Farm

  def initialize(name)
    puts "Welcome to #{name}!"
    @name = name
    main_menu
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts 'What would you like to do?'
    puts '[1] > add a new field'
    puts '[2] > harvest crops'
    puts '[3] > check the status of your farm'
    puts '[4] > take a break and relax'
    puts '[5] > exit the program'
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_field
    when 2 then harvest
    when 3 then status
    when 4 then relax
    when 5 then puts "goodbye!"
      exit
    end
  end

  def add_field
    puts "What type of field are you planting: Corn or Wheat?"
    field_type = gets.chomp.upcase
    puts "How many Hectares will this field be?"
    field_size = gets.chomp.to_i

    if field_type == 'CORN'
      Corn.new('CORN', field_size)
    elsif field_type == 'WHEAT'
      Wheat.new('WHEAT', field_size)
    else
      puts 'Sorry, that is not a valid entry'
      main_menu
    end
    puts "Added a #{field_type} field of #{field_size} hectares!"
  end

  def harvest
    Field.harvest
  end

  def status
    Field.status
  end

  def relax
    puts "You sit back and enjoy your farm. What a lovely day!"
    puts ""
    main_menu
  end

end

class Field

    @@fields = []
    @@total_yield = 0

    attr_accessor :field_size, :field_type, :yield

    CORN = 20
    WHEAT = 30

    def initialize(field_type, field_size)
      @field_type = field_type
      @field_size = field_size
    end

    def self.harvest
      total = 0
      @@fields.each do |field|
        total += field.yield
        puts "Harvesting #{total} tons of food from a #{field.field_size} hectare field."
        @@total_yield = total + field.field_size * field.yield
        puts "The farm has now harvested #{self.total_yield} tons of food in total"
      end




    end

    def self.total_yield
      total = 0
      @@fields.each do |field|
        total += field.yield
      end
      puts "The farm has harvested #{total} tons of food in total."
    end

    def self.status
      @@fields.each do |field|
      puts "#{field.field_type} field is #{field.field_size} hectares."
      puts "#{field.yield} tons of food have been harvested from this farm!"
    end
    end


end


class Corn < Field

  def initialize(field_type, field_size)
    super(field_type, field_size)
    @yield = field_size * CORN
    @@fields << self
  end

end


class Wheat < Field

  def initialize(field_type, field_size)
    super(field_type, field_size)
    @yield = field_size * WHEAT
    @@fields << self
  end

end

a = Farm.new("Jays farm")
