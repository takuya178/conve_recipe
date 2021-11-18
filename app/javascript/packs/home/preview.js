(() => {
  class Preview {
    constructor(obj) {
      const $file = document.getElementById(obj.hookId);
      this.$image = document.getElementById(obj.hookImg);
      this.$NoImage = document.getElementById(obj.hookNoImg);

      $file.addEventListener('change', (e) => {
        this.previewImg(e);
      });
    }
    previewImg(e) {
      // // no-imgをdisplay:noneにする
        this.$NoImage.style.display = 'none';

      // 添付した画像にクラスやデータを付与
      const createImage = (data) => {
        // const $image = document.getElementById('js-main-image');
        const newImage = document.createElement('img'); 
        newImage.setAttribute('class', 'food_create_preview_img');
        newImage.setAttribute('src', data);
        this.$image.appendChild(newImage);
      };

      // 続けて画像を添付する時、前回の画像を削除する
      const imageItem = this.$image.querySelector('img')
      if (imageItem){
        imageItem.remove();
      }
  
      // 取得した画像データを$ImgFileに代入
      const $ImgFile = e.target.files[0];
      const data = window.URL.createObjectURL($ImgFile);
      createImage(data);
    }
  }

  // メインのプレビュー
  const MainPreview = new Preview({
    hookId: 'main_sub_form_image',
    hookImg: 'js-main-image',
    hookNoImg: 'js-main-no-img'
  })

  // サブのプレビュー
  const SubPreview = new Preview({
    hookId: 'main_sub_form_subs_attributes_image',
    hookImg: 'js-sub-image',
    hookNoImg: 'js-sub-no-img'
  })





  JavaScript
$(document).on("turbolinks:load", function () {
  $("#article_title_image").on("change", function (e) {
    var files = e.target.files;
    var d = new $.Deferred().resolve();
    $.each(files, function (i, file) {
      d = d.then(function () {
        return previewImage(file);
      });
    });
  });

  var previewImage = function (imageFile) {
    var reader = new FileReader();
    var img = new Image();
    var def = $.Deferred();
    reader.onload = function (e) {
      // 画像を表示
      $("#image_preview").empty();
      $("#image_preview").append(img);
      img.src = e.target.result;
      def.resolve(img);
    };
    reader.readAsDataURL(imageFile);
    return def.promise();
  };
});





// $(document).on("turbolinks:load", function () {
//   $("#main_sub_form_image").on("change", function (e) {
//     var files = e.target.files;
//     var d = new $.Deferred().resolve();
//     $.each(files, function (i, file) {
//       d = d.then(function () {
//         return previewImage(file);
//       });
//     });
//   });
 
//   var previewImage = function (imageFile) {
//     var reader = new FileReader();
//     var img = new Image();
//     var def = $.Deferred();
//     reader.onload = function (e) {
//       // 画像を表示
//       $("#image_preview").empty();
//       $("#image_preview").append(img);
//       img.src = e.target.result;
//       def.resolve(img);
//     };
//     reader.readAsDataURL(imageFile);
//     return def.promise();
//   };
// });
})();