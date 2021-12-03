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
addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event
  const { id, file } = detail
  console.log(target)
  console.log(detail)
  console.log(id)
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">アップロード中....</span>
    </div>
  `)
})

addEventListener("direct-upload:start", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.remove("direct-upload--pending")
  console.log(element)
})

addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  const progressElement = document.getElementById(`direct-upload-progress-${id}`)
  progressElement.style.width = `${progress}%`
})

addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
})

addEventListener("direct-upload:end", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--complete")
})



// 入力項目を入れるとボタンを押せるようにする
const input_main_name = document.getElementById('js-main-name');
const input_main_calorie = document.getElementById('js-main-calorie');
const input_main_sugar = document.getElementById('js-main-sugar');
const input_main_lipid = document.getElementById('js-main-lipid');
const input_main_salt = document.getElementById('js-main-salt');
const input_main_store = document.getElementById('js-main-store');
const input_main_genre = document.getElementById('js-main-genre');
const input_sub_name = document.getElementById('js-sub-name');
const input_sub_calorie = document.getElementById('js-sub-calorie');
const input_sub_sugar = document.getElementById('js-sub-sugar');
const input_sub_lipid = document.getElementById('js-sub-lipid');
const input_sub_salt = document.getElementById('js-sub-salt');
const input_sub_store = document.getElementById('js-sub-store');

const main_form = document.getElementById('js-form')
const submitBtn = document.getElementById('js-main-btn');

const input_main_image = document.getElementById('main_sub_form_image');
const input_sub_image = document.getElementById('main_sub_form_subs_attributes_image');

submitBtn.disabled = true;

main_form.addEventListener('change', () => {
  if((input_main_name.value == '') || (input_main_calorie.value == '') || (input_main_sugar.value == '') || (input_main_lipid.value == '') || (input_main_salt.value == '')  || (input_sub_name.value == '') || (input_sub_calorie.value == '') || (input_sub_sugar.value == '') || (input_sub_lipid.value == '') || (input_sub_salt.value == '') || (input_sub_store.value == '')) {
    submitBtn.disabled = true;
    submitBtn.classList.add('disabled_btn');
    submitBtn.classList.remove('prime_btn');
  } else {
    submitBtn.disabled = false;
    submitBtn.classList.add('prime_btn');
    submitBtn.classList.remove('disabled_btn');
  }
})

submitBtn.addEventListener('click', (e) => {
  if((input_main_image.value == '') && (input_sub_image.value == '')) {
    e.target.value = '組み合わせを追加する'
  } else {
    e.target.value = '画像をアップロード中...'
  }
})

