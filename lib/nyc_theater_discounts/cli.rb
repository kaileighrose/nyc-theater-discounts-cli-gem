require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::CLI

  def call
    NYCTheaterDiscounts::Scraper.load_TodayTix
    NYCTheaterDiscounts::Scraper.load_Theatermania
    NYCTheaterDiscounts::Scraper.load_BroadwayBox
    puts "Hello theater nerd! Here are the discount sources available:"
    list_vendors
    puts "To see a list of deals for each vendor type the number of the vendor. To search by show type 'by show'. To quit, type 'exit'."
    starting_menu
    goodbye
  end

  def starting_menu
    input = gets.strip
    if input.to_i == 1 || input.to_i == 2 || input.to_i == 3
      vendor = NYCTheaterDiscounts::Vendor.all[input.to_i-1]
      list_deals(vendor)
      puts "To see more deals search either 'by vendor' or 'by show'. To quit type 'exit'."
      input = gets.strip
      menu(input)
    else 
      menu(input)
    end
    
  end

  def menu(input)
    until input.to_s.downcase == "exit"
      if input.to_s.downcase == "by vendor"
        by_vendor_menu
        puts "To see more deals search either 'by vendor' or 'by show'. To quit type 'exit'."
        input = gets.strip
      elsif input.to_s.downcase == "by show"
        by_show_menu
        puts "To see more deals search either 'by vendor' or 'by show'. To quit type 'exit'."
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
    puts "\nTo visit #{vendor.name} go to: #{vendor.url}\n\n"
    vendor.shows.each_with_index do |show, index|
      puts "#{index+1}. #{show.name} -- available from: #{show.price}"
      puts "**to see this offer visit: #{show.deal_url}**\n\n"
    end
  end

  def by_vendor_menu
    list_vendors
    puts "Please enter the number of the discount source you would like to check:"
    input = gets.to_i
    vendor = NYCTheaterDiscounts::Vendor.all[input-1]
    list_deals(vendor)
  end

  def by_show_menu
    puts "Please enter the title of the show you would like to check:"
    input = gets.strip
    input.to_s
    NYCTheaterDiscounts::Vendor.all.each do |vendor|
      vendor.shows.each do |show|
        if show.name.downcase.include? input.downcase
          puts "At #{vendor.name}: #{show.name} -- available from: #{show.price}"
          puts "**to see this offer visit: #{show.deal_url}**\n\n"
        end
      end
    end
    puts "We did not find any additional shows associated with your query."
  end

  def goodbye
    puts "Thank you for using nyc-theater-discounts. Check back again tomorrow!"
  end
end
