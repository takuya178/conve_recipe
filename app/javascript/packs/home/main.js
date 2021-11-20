// 無限スクロール
import InfiniteScroll from 'infinite-scroll';
let infScroll = new InfiniteScroll( '.infinity_contain', {
  path: "a[rel=next]",
  append: ".infinity_page",
  prefill: false,
  history: false,
  hideNav: ".pagy-bootstrap-nav",
})
