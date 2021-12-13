require 'rails_helper'

RSpec.describe Main, type: :system do
  let!(:main) { create (:main) }
  let(:sub) { create (:sub) }

  describe '組み合わせ一覧' do
    context '組み合わせがある場合' do
      it '組み合わせ一覧が表示されること' do
        visit mains_path
        expect(page).to have_content(main.name)
        expect(page).to have_content(main.stores_i18n)
      end
    end

    context '13件以下の場合' do
      let!(:main) { create_list(:main, 13) }
      it 'ページングが表示されないこと' do
        visit mains_path
        expect(page).not_to have_selector('.pagination')
      end
    end
  end

  describe '新規作成' do

    before do
      visit new_main_path
    end

    it '組み合わせ作成' do
      fill_in 'main_sub_form[name]', with: 'スパゲティ'
      fill_in 'main_sub_form[calorie]', with: 100
      fill_in 'main_sub_form[sugar]', with: 100
      fill_in 'main_sub_form[lipid]', with: 100
      fill_in 'main_sub_form[salt]', with: 100
      find('#js-main-store').find("option[value='seven']").select_option
      find('#js-main-genre').find("option[value='noodle']").select_option
      fill_in 'main_sub_form[subs_attributes][name]', with: 'タコバジル'
      fill_in 'main_sub_form[subs_attributes][calorie]', with: 100
      fill_in 'main_sub_form[subs_attributes][sugar]', with: 100
      fill_in 'main_sub_form[subs_attributes][lipid]', with: 100
      fill_in 'main_sub_form[subs_attributes][salt]', with: 100
      find('#js-sub-store').find("option[value='seven']").select_option
      click_button '組み合わせを追加する'
      expect(page).to have_content '組み合わせを追加しました'
    end

    context 'メイン画像のvalidation' do
      it '5MBよりも大きいサイズの画像を投稿した場合' do
        attach_file "main_sub_form[image]", "#{Rails.root}/spec/fixtures/images/15MB.jpeg", make_visible: true
        expect(page).to have_content '画像サイズを5MB以下にしてください'  
      end
      it 'jpeg/jpg/png以外の画像拡張子表示した時' do
        attach_file "main_sub_form[image]", "#{Rails.root}/spec/fixtures/images/sample.txt", make_visible: true
        expect(page).to have_content '画像の拡張子は.png .jpg .jpegのみです' 
      end
    end

    context 'サブ画像のvalidation' do
      it '5MBよりも大きいサイズの画像を投稿した場合' do
        attach_file "main_sub_form[subs_attributes][image]", "#{Rails.root}/spec/fixtures/images/15MB.jpeg", make_visible: true
        expect(page).to have_content '画像サイズを5MB以下にしてください'  
      end
      it 'jpeg/jpg/png以外の画像拡張子表示した時' do
        attach_file "main_sub_form[subs_attributes][image]", "#{Rails.root}/spec/fixtures/images/sample.txt", make_visible: true
        expect(page).to have_content '画像の拡張子は.png .jpg .jpegのみです' 
      end
    end
  end
end



