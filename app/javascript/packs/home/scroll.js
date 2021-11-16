import InfiniteScroll from 'infinite-scroll';
// 無限スクロール
let infScroll = new InfiniteScroll( '.food_combination', {
  path: 'ul.pagination a[rel=next]',
  append: '.food_combi_contain',
  // prefill: false,
  // history: false,
  // hideNav: '.pagy-bootstrap-nav'
})