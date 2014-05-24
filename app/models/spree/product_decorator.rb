Spree::Product.class_eval do
  after_touch :clear_product_cache

  def self.popular_products(limit = 8)
    descend_by_popularity.limit(limit)
  end

  def self.recent_product(limit)
    order('available_on DESC').limit(limit)
  end

  def product_cache_key
    "product-#{id}"
  end

  private

  def clear_product_cache
    Rails.cache.delete(in_stock_cache_key)
  end
end