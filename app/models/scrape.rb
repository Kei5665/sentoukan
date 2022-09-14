class Scrape
  require 'mechanize'
  require 'google_maps_service'

  def scrape(page_num)
    shops = []
    urls = []

    # gem google-map-servise
    gmap = GoogleMapsService::Client.new(key: ENV['API_KEY'])

    # gem mechanize
    agent = Mechanize.new
    page = agent.get(ENV['SCRAPE_URL'] + "#{page_num}")
    elements = page.search('main .mx-5 a')

    elements.each do |ele|
      urls << ele.get_attribute(:href)
    end

    urls.each do |url|
      detail_page = agent.get(url)
      name = detail_page.at('/html/body/main/div/section[5]/div/div[2]/div[1]/p[2]')&.inner_text
      address = detail_page.at('/html/body/main/div/section[5]/div/div[2]/div[3]/p[2]')&.inner_text
      opening_hours = detail_page.at('/html/body/main/div/section[5]/div/div[2]/div[5]/div')&.inner_text

      # geocode
      comp = gmap.geocode(address)
      latitude = comp[0][:geometry][:location][:lat]
      longitude = comp[0][:geometry][:location][:lng]

      # need refact
      shop = Shop.new
      shop.name = name
      shop.address = address
      shop.opening_hours = opening_hours
      shop.latitude = latitude
      shop.longitude = longitude
      shops.push(shop)
    end
    shops
  end
end
