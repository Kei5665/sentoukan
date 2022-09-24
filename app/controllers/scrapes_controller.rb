class ScrapesController < ApplicationController
  def index; end

  def create
    form = Form::ShopCollection.new(shop_collection_params)
    if form.save
      redirect_to scrapes_path, green: 'データを保存しました'
    else
      redirect_to scrapes_path, pink: 'データを保存できません'
    end
  end

  def scrape
    scrape = Scrape.new
    scraped_data = scrape.scrape(params[:scrape_url])

    shop_collection = Form::ShopCollection.new
<<<<<<< HEAD
    shop_collection.assign(scraped_data)
=======
    shop_collection.put_data_into_the_form(scraped_data)
>>>>>>> a3254c7b79e4a5c6b964ea0c318da7259824961e

    render turbo_stream: turbo_stream.replace(
      'scrapes',
      partial: 'scrapes/after_scrapes',
      locals: { form: shop_collection },
    )
  end

  private

    def shop_collection_params
      params.require(:form_shop_collection).
        permit(shops_attributes: [:name, :address, :opening_hours, :latitude, :longitude, :avalability])
    end
end
