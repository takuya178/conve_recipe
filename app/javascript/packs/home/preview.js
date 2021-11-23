class Preview {
  constructor(obj) {
    // const $file = null; // 選択されるファイル
    this.MAX_WIDTH = 400; 
    this.MAX_HEIGHT = 400;
    this.$input = document.getElementById(obj.inputId);
    this.$canvas = document.getElementById(obj.canvasId);
    this.$NoImage = document.getElementById(obj.noImg);

    this.$input.addEventListener('change', () => {
      this.previewImg()
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