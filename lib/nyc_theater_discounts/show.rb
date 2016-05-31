require 'nokogiri'
require 'pry'

class NYCTheaterDiscounts::Show

  attr_accessor :name, :price, :vendor, :deal_url

  @@all = []

  def initialize(name, price, deal_url)
    @name = name
    @price = price
    @deal_url = deal_url
    @vendors = []
    @@all << self
  end
  
  def self.all
     if @@all.uniq == @@all
      @@all
    else
      @@all.uniq!
    end
  end

  def vendors
    if @vendors.uniq == @vendors
      @vendors
    else
      @vendors.uniq!
    end
    return @vendors
  end

  def find_by_name(nameval)
    self.all.detect{|a| a.name == nameval}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
  
end