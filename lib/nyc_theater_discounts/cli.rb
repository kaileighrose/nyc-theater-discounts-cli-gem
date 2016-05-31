require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::CLI

  def call
    NYCTheaterDiscounts::Scraper.load_TodayTix
    puts "Hello theatre nerd! Here are the discount sources available:"
    list_vendors
    menu
  end

  def list_vendors
    NYCTheaterDiscounts::Vendor.all.each_with_index {|index, value| puts "#{index}. #{value.name}"}
  end
  
  def list_deals(vendor)
    puts "to visit #{vendor.name} go to: #{vendor.url}"
    vendor.shows.each do |show|
      puts "#{show.name} -- available from: #{show.price}"
      puts "***for more information visit #{show.deal_url}**"
    end
  end

  def menu
    puts "Please enter the number of the vendor you would like to check:"
    input = gets.to_i
    vendor = NYCTheaterDiscounts::Vendor.all[input-1]
    list_deals(vendor)
    goodbye
  end

  def goodbye
    "Thank you for using nyc-theater-discounts!"
  end
end
