module ApplicationHelper

  def spree_slider_count_to_indicator
    Spree::Slide.published.count-1
  end

  def render_slide_image slide, index
    if slide.slide_link.present? && slide.product.nil?
      link_to slide.slide_link, class: 'item animated fadeInRight' do
        render partial: 'spree/shared/slide', locals: {slide: slide, active: index.zero?}
      end
    else
      render partial: 'spree/shared/slide', locals: {slide: slide, active: index.zero?}
    end
  end

  def cache_key_for_popular_products
    max_updated_at = (@popular_products.maximum(:updated_at) || Date.today).to_s(:number)
    "#{current_currency}/spree/products/popular-#{max_updated_at}"
  end
end
