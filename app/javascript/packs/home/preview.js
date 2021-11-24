class Preview {  constructor(obj) {
    // const $file = null; // 選択されるファイル
    this.MAX_WIDTH = 1000; 
    this.MAX_HEIGHT = 1000;
    this.$input = document.getElementById(obj.inputId);
    this.$canvas = document.getElementById(obj.canvasId);
    this.$NoImage = document.getElementById(obj.noImg);

    this.$input.addEventListener('change', (e) => {
      this.previewImg()
      console.log("ファイルサイズ：" + e.target.files[0].size / 1024 / 1024 + 'MB');

      console.log(e.target.files[0].size / 1024 / 1024 + 'MB')
      console.log(file.size / 1024 / 1024 + 'MB')
    })
  }
  previewImg() {
    this.$NoImage.style.display = 'none';
    const $file = this.$input.files[0];

    // 画像をリサイズ
    const image = document.createElement('img')
    const reader = new FileReader();

    reader.onload = (e) => {
      image.onload = () => {
        if(image.width > image.height){
          // 横長の画像は横のサイズを指定値にあわせる
          const ratio = image.height/image.width;
          width = this.MAX_WIDTH;
          height = this.MAX_WIDTH * ratio;
        } else {
          // 縦長の画像は縦のサイズを指定値にあわせる
          const ratio = image.width/image.height;
          width = this.MAX_HEIGHT * ratio;
          height = this.MAX_HEIGHT;
        }
        // canvasにwidthとheightの値を代入
        this.$canvas;
        this.$canvas.setAttribute('width', width);
        this.$canvas.setAttribute('height', height);

        const ctx = this.$canvas.getContext('2d');
        ctx.clearRect(0,0,width,height);
        // canvasにサムネイルを描画
        ctx.drawImage(image,0,0,image.width,image.height,0,0,width,height);

        const base64 = this.$canvas.toDataURL('image/jpg');

        // base64から画像データを作成する
        var barr, bin, i, len;
        bin = atob(base64.split('base64,')[1]);
        len = bin.length;
        barr = new Uint8Array(len);
        i = 0;
        while (i < len) {
          barr[i] = bin.charCodeAt(i);
          i++;
        }
        blob = new Blob([barr], {type: 'image/jpg'});
      }
      image.src = e.target.result;
    }
    reader.readAsDataURL($file);
  };
}

  // メインのプレビュー
  const MainPreview = new Preview({
    inputId: 'main_sub_form_image',
    canvasId: 'main_canvas',
    noImg: 'js-main-no-img'
  })

  // サブのプレビュー
  const SubPreview = new Preview({
    inputId: 'main_sub_form_subs_attributes_image',
    canvasId: 'sub_canvas',
    noImg: 'js-sub-no-img'
  })





// $(function() {
//   var file = null; // 選択ファイルが格納される変数
//   var blob = null; // 画像(BLOBデータ)が格納される変数
//   const THUMBNAIL_MAX_WIDTH = 500; // 画像がヨコ長の場合、横サイズがこの値になるように縮小される
//   const THUMBNAIL_MAX_HEIGHT = 500; // 画像がタテ長の場合、縦サイズがこの値になるように縮小される

//   // ファイルが選択されたら実行される関数
//   $('input[type=file]').change(function() {

//     // ファイルを取得する
//     file = $(this).prop('files')[0];

//     // 選択されたファイルが画像かどうか判定する
//     // ここでは、jpeg形式とpng形式のみを画像をみなす
//     if (file.type != 'image/jpeg' && file.type != 'image/png') {
//       // 画像でない場合は何もせず終了する
//       file = null;
//       blob = null;
//       return;
//     }

//     // 画像をリサイズする
//     var image = new Image();
//     var reader = new FileReader();
//     reader.onload = function(e) {
//       image.onload = function() {

//         // 縮小後のサイズを計算する
//         var width, height;
//         if(image.width > image.height){
//           // ヨコ長の画像は横サイズを定数にあわせる
//           var ratio = image.height/image.width;
//           width = THUMBNAIL_MAX_WIDTH;
//           height = THUMBNAIL_MAX_WIDTH * ratio;
//         } else {
//           // タテ長の画像は縦のサイズを定数にあわせる
//           var ratio = image.width/image.height;
//           width = THUMBNAIL_MAX_HEIGHT * ratio;
//           height = THUMBNAIL_MAX_HEIGHT;
//         }

//         // 縮小画像を描画するcanvasのサイズを上で算出した値に変更する
//         var canvas = $('#main_canvas')
//                      .attr('width', width)
//                      .attr('height', height);

//         var ctx = canvas[0].getContext('2d');

//         // canvasに既に描画されている画像があればそれを消す
//         ctx.clearRect(0,0,width,height);

//         // canvasに縮小画像を描画する
//         ctx.drawImage(image,
//           0, 0, image.width, image.height,
//           0, 0, width, height
//         );

//         // canvasから画像をbase64として取得する
//         var base64 = canvas.get(0).toDataURL('image/jpeg');

//         // base64から画像データを作成する
//         var barr, bin, i, len;
//         bin = atob(base64.split('base64,')[1]);
//         len = bin.length;
//         barr = new Uint8Array(len);
//         i = 0;
//         while (i < len) {
//           barr[i] = bin.charCodeAt(i);
//           i++;
//         }
//         blob = new Blob([barr], {type: 'image/jpeg'});

//       }
//       image.src = e.target.result;
//     }
//     reader.readAsDataURL(file);
//   });
// });









// $(function() {
//   var file = null; // 選択ファイルが格納される変数
//   var blob = null; // 画像(BLOBデータ)が格納される変数
//   const THUMBNAIL_MAX_WIDTH = 500; // 画像がヨコ長の場合、横サイズがこの値になるように縮小される
//   const THUMBNAIL_MAX_HEIGHT = 500; // 画像がタテ長の場合、縦サイズがこの値になるように縮小される

//   // ファイルが選択されたら実行される関数
//   $('input[type=file]').change(function() {

//     // ファイルを取得する
//     file = $(this).prop('files')[0];

//     // 選択されたファイルが画像かどうか判定する
//     // ここでは、jpeg形式とpng形式のみを画像をみなす
//     if (file.type != 'image/jpeg' && file.type != 'image/png') {
//       // 画像でない場合は何もせず終了する
//       file = null;
//       blob = null;
//       return;
//     }

//     // 画像をリサイズする
//     var image = new Image();
//     var reader = new FileReader();
//     reader.onload = function(e) {
//       image.onload = function() {

//         // 縮小後のサイズを計算する
//         var width, height;
//         if(image.width > image.height){
//           // ヨコ長の画像は横サイズを定数にあわせる
//           var ratio = image.height/image.width;
//           width = THUMBNAIL_MAX_WIDTH;
//           height = THUMBNAIL_MAX_WIDTH * ratio;
//         } else {
//           // タテ長の画像は縦のサイズを定数にあわせる
//           var ratio = image.width/image.height;
//           width = THUMBNAIL_MAX_HEIGHT * ratio;
//           height = THUMBNAIL_MAX_HEIGHT;
//         }

//         // 縮小画像を描画するcanvasのサイズを上で算出した値に変更する
//         var canvas = $('#sub_canvas')
//                      .attr('width', width)
//                      .attr('height', height);

//         var ctx = canvas[0].getContext('2d');

//         // canvasに既に描画されている画像があればそれを消す
//         ctx.clearRect(0,0,width,height);

//         // canvasに縮小画像を描画する
//         ctx.drawImage(image,
//           0, 0, image.width, image.height,
//           0, 0, width, height
//         );

//         // canvasから画像をbase64として取得する
//         var base64 = canvas.get(0).toDataURL('image/jpeg');

//         // base64から画像データを作成する
//         var barr, bin, i, len;
//         bin = atob(base64.split('base64,')[1]);
//         len = bin.length;
//         barr = new Uint8Array(len);
//         i = 0;
//         while (i < len) {
//           barr[i] = bin.charCodeAt(i);
//           i++;
//         }
//         blob = new Blob([barr], {type: 'image/jpeg'});

//       }
//       image.src = e.target.result;
//     }
//     reader.readAsDataURL(file);
//   });
// });