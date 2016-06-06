require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::Vendor

  attr_accessor :name, :url, :shows, :lowest_price

  @@all = []

  def initialize( vendor_name, path)
    @name = vendor_name
    @url = path
    @shows = []
    @@all << self
  end
  
  def self.all
    @@all
  end

  def shows
    @shows
  end
end
