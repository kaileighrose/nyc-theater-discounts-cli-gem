require 'nokogiri'
require 'open-uri'
require 'pry'

class NYCTheaterDiscounts::Scraper
  attr_accessor :name, :url, :shows, :lowest_price

  def self.load_TodayTix
    deals_page = Nokogiri::HTML(open('http://www.todaytix.com/us/nyc/shows/'))
    
    todaytix = NYCTheaterDiscounts::Vendor.new("TodayTix", "http://www.todaytix.com/us/nyc/shows/")

    deals_page.css("div.shows_hero_container a.heroTile.grid").each do |show|

      title = show.css('header span.title').text
      link = "http://www.todaytix.com/" + show['href']
      price = show['data-min-price']

      if title.include?("Referral Program") != true && title.include?("Gift Cards") != true
        newshow = NYCTheaterDiscounts::Show.new(title, price, link)
        newshow.vendors << todaytix
        todaytix.shows << newshow
      end
      ##div.shows_hero_container a.heroTile.grid
      ##href
      ##data-min-price **add $**
      ##header span.title
    end
  end
end