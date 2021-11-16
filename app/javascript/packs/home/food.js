// (() => {
  const tab = document.getElementById('js-tab');
  const contain = document.getElementById('js-food-contain');
  const normal = document.getElementById('js-normalselect');
  const abnormal = document.getElementById('js-ngselect');
  const normalbtn = document.getElementById('js-normalbtn');
  const ngbtn = document.getElementById('js-ngbtn');
  const contents = document.querySelectorAll('#js-contents');
  const table = document.getElementById('food_table');
  const ngfood = document.getElementById('js-ngfood');
  const scroll = document.getElementById( 'js-scroll-fadein' );

  ngfood.addEventListener('click', () => {
    location.href = '/overdose_food_combinations' + location.search
  });

  // スクロールトップ

  //スクロール量を取得する関数
  const getScrolled = () => {
    let ref;
    if(window.pageYOffset !== undefined) {
      ref = window.pageYOffset;
    }else {
      ref = document.documentElement.scrollTop;
    }
    return ref;
  };
  //ボタンの表示・非表示
  window.onscroll = () => {
    if(getScrolled() > 500) {
      scroll.classList.add( 'is-fadein' )
    }else {
      scroll.classList.remove( 'is-fadein' );
    }
  };
  // トップに移動する
  const scrollTop = () => {
    window.scrollTo( 0, 0 );
  }
  // スクロールボタンをクリックできるようにする
  scroll.addEventListener('click', () => {
    scrollTop();
  })

  // ローディング
  window.addEventListener("load", () => {
    setTimeout(() => {
      document.getElementById("loading").classList.remove("active")
    }, 500)
  })

import InfiniteScroll from 'infinite-scroll';

// 無限スクロール
let infScroll = new InfiniteScroll( '.js_contain', {
  path: 'nav ul.pagination li.page-item a[rel=next]',
  append: '.food_combi_contain',
  prefill: false,
  history: true,
  // hideNav: '.pagy-bootstrap-nav'
})

// })()
