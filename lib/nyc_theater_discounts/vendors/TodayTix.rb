class TodayTix < Vendor
  
  def import_shows(path)
    html = open(path)
    deals_page = Nokogiri::HTML(html)

    
  end
  
  
end