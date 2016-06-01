require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::CLI

  def call
    NYCTheaterDiscounts::Scraper.load_TodayTix
    puts "Hello theater nerd! Here are the discount sources available:"
    list_vendors
    puts "Type 'exit' at any point to exit the program. Otherwise, type 'by vendor' or 'by show' to see today's deals."
    menu
    goodbye
  end

  def menu
    input = gets.strip
    until input.to_s.downcase == "exit"
      if input.to_s.downcase == "by vendor"
        by_vendor_menu
        input = gets.strip
      elsif input.to_s.downcase == "by show"
        by_show_menu
        input = gets.strip
      else
        puts "Please choose either 'by vendor' or 'by show'. To quit type 'exit'."
        input = gets.strip
      end
    end
  end

  def list_vendors
    NYCTheaterDiscounts::Vendor.all.each_with_index {|value, index| puts "#{index+1}. #{value.name}"}
  end
  
  def list_deals(vendor)
    puts "to visit #{vendor.name} go to: #{vendor.url}"
    vendor.shows.each_with_index do |show, index|
      puts "#{index+1}. #{show.name} -- available from: $#{show.price}"
      puts "***for more information visit #{show.deal_url}***\n"
    end
  end

  def by_vendor_menu
    puts "Please enter the number of the discount source you would like to check:"
    input = gets.to_i
    vendor = NYCTheaterDiscounts::Vendor.all[input-1]
    list_deals(vendor)
  end

  def by_show_menu
    puts "Please enter the title of the show you would like to check:"
  end

  def goodbye
    puts "Thank you for using nyc-theater-discounts!"
  end
end
