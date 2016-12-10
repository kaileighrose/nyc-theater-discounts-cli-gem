require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require 'pry'

class NYCTheaterDiscounts::Scraper
  attr_accessor :name, :url, :shows, :lowest_price

  def self.load_TodayTix 
    deals_page = Nokogiri::HTML(open('http://www.todaytix.com/shows/nyc', :allow_redirections => :safe))
    
    todaytix = NYCTheaterDiscounts::Vendor.new("TodayTix", "http://www.todaytix.com/shows/nyc")
    
    deals_page.css("div.I3zMcHNtRg div._21gi2wD4sz._1f5fyaMPhI.vn2NosAHjv._8jlYkaoq2i").each do |show|
      
      title = show.css('._3BMC9wgoBo').text
      price = show.css('._3ZG8APBefO').text
      step = show.css('a')
      link = "http://www.todaytix.com" + step[0]['href']
      
      
      if title.include?("The Public Theater") != true && title.include?("Weekend Getaway") != true && title.include?("Referral Program") != true && price.include?("$")
        newshow = NYCTheaterDiscounts::Show.new(title, price, link)
        newshow.vendors << todaytix
        todaytix.shows << newshow
      end
    end
  end

  def self.load_Theatermania
    deals_page = Nokogiri::HTML(open('http://www.theatermania.com/new-york-city-theater/discount-tickets/'))
    
    theatermania = NYCTheaterDiscounts::Vendor.new("Theatermania", "http://www.theatermania.com/new-york-city-theater/discount-tickets/")

    deals_page.css("div#listings_right div#result div.list div.show.logo").each do |show|
 
      title = show.css('a.show-title span.show-name').text
      link = "http://www.theatermania.com" + show.css('a.show-title')[0]['href']
      price = show.css("div strong").text
      
      newshow = NYCTheaterDiscounts::Show.new(title, price, link)
      newshow.vendors << theatermania
      theatermania.shows << newshow
    end
  end

   def self.load_BroadwayBox
    deals_page = Nokogiri::HTML(open('http://www.broadwaybox.com/shows/tickets/discounts/?v=b'))
    
    broadwaybox = NYCTheaterDiscounts::Vendor.new("BroadwayBox", "http://www.broadwaybox.com/shows/tickets/discounts/?v=b")

    deals_page.css("div.list-group.list-quebec a.list-group-item").each do |show|
 
      title = show.css('div.media-body div.event-title').text
      link = "http://www.broadwaybox.com" + show['href']

      show_page = Nokogiri::HTML(open(link))
      price = show_page.css("div.col-md-6 p.slat-title strong")[0].text
      price.slice!(/Tickets\sjust\s/)
      
      newshow = NYCTheaterDiscounts::Show.new(title, price, link)
      newshow.vendors << broadwaybox
      broadwaybox.shows << newshow
    end
  end
end