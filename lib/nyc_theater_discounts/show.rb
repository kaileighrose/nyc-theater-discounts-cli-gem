require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::Show

  attr_accessor :name, :price, :vendor, :deal_url

  @@all = []

  def initialize(show_name, show_price, url)
    @name = show_name
    @price = show_price
    @deal_url = url
    @vendors = []
    @@all << self
  end

  
  def self.all
    @@all
  end

  def vendors
    @vendors
  end

  def find_by_name(nameval)
    self.all.detect{|a| a.name == nameval}
  end
  
end