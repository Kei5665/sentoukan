class ScrapesController < ApplicationController
  def index
  end

  def create
  end

  def scrape
    scrape = Scrape.new
    scraped_data = scrape.scrape(params[:page_num])

    shop_collection = Form::ShopCollection.new
    shop_collection.set_scraped_data(scraped_data)

    render turbo_stream: turbo_stream.replace(
      'scrapes',
      partial: 'scrapes/after_scrapes',
      locals: { form: shop_collection },
    )
  end
end
