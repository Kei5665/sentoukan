class Form::ShopCollection < Form::Base
  FORM_COUNT = 20 #ここで、作成したい登録フォームの数を指定
  attr_accessor :shops

  def initialize(attributes = {})
    super attributes
    self.shops = FORM_COUNT.times.map { Shop.new() } unless self.shops.present?
  end

  def set_scraped_data(shops)
    self.shops = shops
  end

  def shops_attributes=(attributes)
    self.shops = attributes.map { |_, v| Shop.new(v) }
  end

  def save
    Shop.transaction do
      self.shops.map do |shop|
        if shop.avalability
          shop.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end
