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
      const newImage = document.createElement('img'); 
      newImage.setAttribute('class', 'food_create_preview_img');
      newImage.setAttribute('src', data);
      // no-img画像に添付した画像を挿入する
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




// ダイレクトアップロード
// $(function() {
//   $('.directUpload').find("input:file").each(function(i, elem) {
//     var fileInput    = $(elem);
//     console.log(fileInput)
//     var form         = $(fileInput.parents('form:first'));
//     console.log(form)
//     var submitButton = form.find('input[type="submit"]');
//     console.log(submitButton)
//     var progressBar  = $("<div class='bar'></div>");
//     console.log(progressBar)
//     var barContainer = $("<div class='progress'></div>").append
//     (progressBar);
//     console.log(barContainer)
//     fileInput.after(barContainer);
//     fileInput.fileupload({
//       fileInput:       fileInput,
//       url:             form.data('url'),
//       type:            'POST',
//       autoUpload:       true,
//       formData:         form.data('form-data'),
//       paramName:        'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
//       dataType:         'XML',  // S3 returns XML if success_action_status is set to 201
//       replaceFileInput: false,
//       progressall: function (e, data) {
//         var progress = parseInt(data.loaded / data.total * 100, 10);
//         progressBar.css('width', progress + '%')
//       },
//       start: function (e) {
//         submitButton.prop('disabled', true);

//         progressBar.
//           css('background', 'green').
//           css('display', 'block').
//           css('width', '0%').
//           text("Loading...");
//       },
//       done: function(e, data) {
//         submitButton.prop('disabled', false);
//         progressBar.text("Uploading done");

//         // extract key and generate URL from response
//         var key   = $(data.jqXHR.responseXML).find("Key").text();
//         var url   = '//' + form.data('host') + '/' + key;

//         // create hidden field
//         var input = $("<input />", { type:'hidden', name: fileInput.attr('name'), value: url })
//         form.append(input);
//       },
//       fail: function(e, data) {
//         submitButton.prop('disabled', false);

//         progressBar.
//           css("background", "red").
//           text("Failed");
//       }
//     });
//   });
// });
