require 'rails_helper'

RSpec.describe Main, type: :system do
  let(:main) { create(:main) }
  let(:genre) { create :main, :genre }
  let(:user) { create(:user) }

  context '入力に成功' do
    before { login(user) }
    before do
      @sub_params = {
        subs_attributes: {
          "0": FactoryBot.attributes_for(:sub)
        }
      }
      @params_nested = { 
        main: FactoryBot.attributes_for(:main).merge( @sub_params )
      }
    end
    it "組み合わせページに入力しているなら成功" do
      visit new_main_path
      expect {
        fill_in 'main[name]', with: @params_nested[:main][:name]
        fill_in 'main[calorie]', with: @params_nested[:main][:calorie]
        fill_in 'main[sugar]', with: @params_nested[:main][:sugar]
        fill_in 'main[lipid]', with: @params_nested[:main][:lipid]
        fill_in 'main[salt]', with: @params_nested[:main][:salt]
        find('#main_stores').find("option[value='seven']").select_option
        find('#main_genre').find("option[value='noodle']").select_option
        fill_in 'main[subs_attributes][0][name]', with: @params_nested[:main][:subs_attributes][:"0"][:name]
        fill_in 'main[subs_attributes][0][calorie]', with: @params_nested[:main][:subs_attributes][:"0"][:calorie] 
        fill_in 'main[subs_attributes][0][sugar]', with: @params_nested[:main][:subs_attributes][:"0"][:sugar] 
        fill_in 'main[subs_attributes][0][lipid]', with: @params_nested[:main][:subs_attributes][:"0"][:lipid] 
        fill_in 'main[subs_attributes][0][salt]', with: @params_nested[:main][:subs_attributes][:"0"][:salt] 
        click_button '組み合わせを登録'
      }.to change(Main, :count).by(1) and change(Sub, :count).by(1)
      expect(page).to have_content('組み合わせを追加しました'), '不ラッシュメッセージ 「組み合わせを追加しました」が表示されていません'
    end
  end

  context '各項目が未入力の場合' do
    before { login(user) }
    it "組み合わせページの入力が空白ならエラー" do
      visit new_main_path
      fill_in 'main[name]', with: ''
      fill_in 'main[calorie]', with: ''
      fill_in 'main[sugar]', with: ''
      fill_in 'main[lipid]', with: ''
      fill_in 'main[salt]', with: ''
      fill_in 'main[subs_attributes][0][name]', with: ''
      fill_in 'main[subs_attributes][0][calorie]', with: ''
      fill_in 'main[subs_attributes][0][sugar]', with: ''
      fill_in 'main[subs_attributes][0][lipid]', with: ''
      fill_in 'main[subs_attributes][0][salt]', with: ''
      click_button '組み合わせを登録'
      expect(page).to have_content '組み合わせの追加に失敗しました'
      expect(page).to have_content '商品名を入力してください'
      expect(page).to have_content 'カロリーを入力してください'
      expect(page).to have_content '炭水化物を入力してください'
      expect(page).to have_content '脂質を入力してください'
      expect(page).to have_content '塩分を入力してください'
      expect(page).to have_content '商品名を入力してください'
      expect(page).to have_content 'カロリーを入力してください'
      expect(page).to have_content '炭水化物を入力してください'
      expect(page).to have_content '脂質を入力してください'
      expect(page).to have_content '塩分を入力してください'
    end
  end

  context '商品名が30文字以上の場合' do
    before { login(user) }
    it '商品名が30文字以上ならエラー' do
      visit new_main_path
      fill_in 'main[name]', with: 'a' * 31
      fill_in 'main[subs_attributes][0][name]', with: 'a' * 31
      click_button '組み合わせを登録'
      expect(page).to have_content '商品名は30文字以内で入力してください'
      expect(page).to have_content '商品名は30文字以内で入力してください'
    end
  end
end

