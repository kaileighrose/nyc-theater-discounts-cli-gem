require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::Vendor

  attr_accessor :name, :url, :shows, :lowest_price

  @@all = []

  def initialize(name, path)
    @name = name
    @url = path
    @shows = []
    @@all << self
  end
  
  def self.all
     if @@all.uniq == @@all
      @@all
    else
      @@all.uniq!
    end
  end

  def shows
    if @shows.uniq == @shows
      @shows
    else
      @shows.uniq!
    end
    return @shows
  end

  def self.load_TodayTix
    deals_page = Nokogiri::HTML(open('http://www.todaytix.com/us/nyc/shows/'))

    todaytix = self.new("TodayTix", "http://www.todaytix.com/us/nyc/shows/")

    deals_page.css("div.shows_hero_container a.heroTile.grid").each do |show|

      title = show.css('header span.title').text
      link = show['href']
      price = "$" + show.css('data-min-price')

      newshow = NYCTheaterDiscounts::Show.new(title, price, link)
      newshow.vendors << todaytix
      todaytix.shows << newshow
      ##div.shows_hero_container a.heroTile.grid
      ##href
      ##data-min-price **add $**
      ##header span.title
    end
  end
end
