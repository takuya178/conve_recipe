module ApplicationHelper
  include Pagy::Frontend

  def page_title(page_title = '')
    base_title = 'health_conve'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'healthy-combi',
      title: 'コンビニ食品をペアリング',
      reverse: true,
      charset: 'utf-8',
      separator: '|',
      description: 'コンビニ食品を麺類・ご飯類の中から食べたいジャンルを選んでいただき、それに合う一品料理と摂取を控えたい成分が表示されます。お好みの組み合わせを作れるので皆と共有しよう！',
      keywords: 'healthy-combi, 成分, コンビニ 組み合わせ, ',
      canonical: request.original_url,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('ogp_apple_touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_twitter_card.png'),
        locale: 'ja_JP'
      },
      twitter: {
        site: '@st3110123',
        card: 'summary_large_image',
        image: image_url('ogp_twitter_card.png')
      }
    }
  end
end
