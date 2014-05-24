Spree::BaseHelper.class_eval do
  def taxons_tree(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.children.empty?
    ul_css_class = (max_level == Spree::Config[:max_level_in_taxons_menu]) ? 'nav' : nil
    content_tag :ul, class: ul_css_class do
      root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current' : nil
        content_tag :li, class: css_class do
          link_to("<i class=\"fa fa-circle\"></i> #{taxon.name}".html_safe, seo_url(taxon)) +
          taxons_tree(taxon, current_taxon, max_level - 1)
        end
      end.join("\n").html_safe
    end
  end
end