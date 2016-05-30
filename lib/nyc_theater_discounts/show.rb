class Show
   extend Concerns::Findable

  attr_accessor :name, :price, :vendor

  @@all = []

  def initialize(name, price)
    @name = name
    @price = price
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
  
end