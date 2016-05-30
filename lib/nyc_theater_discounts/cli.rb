require_relative "../lib/nyc_theater_discounts.rb"
require_relative "../lib/student.rb"

class NYCTheaterDiscounts::CLI
  def initialize(args)
    
  end

  def call
    puts "Hello theatre nerd! Here are the discount sources available (pick one): "
    list_vendors
    input = gets
    list_deals
    menu
  end

  def list_vendors
    puts "TodayTix"
  end
  
  def list_deals
    
  end

  def menu
    
  end

  def goodbye
    
  end
end
