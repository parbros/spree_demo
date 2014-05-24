Spree::HomeController.class_eval do
  def index
    @slides = Spree::Slide.published.order('position ASC')
    @popular_products = Spree::Product.popular_products(8)
    @recent_products = Spree::Product.recent_product(8)
  end
end