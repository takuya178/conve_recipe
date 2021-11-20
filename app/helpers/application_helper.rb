module ApplicationHelper
  include Pagy::Frontend

  def page_title(page_title = '')
    base_title = 'health_conve'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def lazy_image_tag(source, options = {})
    options['data-src'] = asset_path(source)
    if options[:class].blank?
      options[:class] = 'lozad'
    else
      options[:class] = "lozad #{options[:class]}"
    end
    image_tag('noimage.jpg', options)
  end
end
