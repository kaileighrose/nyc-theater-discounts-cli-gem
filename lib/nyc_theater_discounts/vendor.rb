require 'nokogiri'
require 'pry'

class Vendor
   extend Concerns::Findable

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

end
