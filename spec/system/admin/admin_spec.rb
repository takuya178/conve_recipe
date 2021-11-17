require 'rails_helper'

RSpec.describe "Admins", type: :system do
  let(:general) { create :user }
  let(:admin) { create :user, :admin }
  let(:main) { create :main }
  let(:sub) { create :sub }
  
  describe '管理画面へのアクセス' do
    context '一般ユーザーの場合' do
      context 'ログイン前' do
        it '管理画面へのアクセスが失敗する' do
          general
          visit admin_root_path
          expect(page).to have_content '管理者以外ログインできません'
        end
      end
    end
    context 'ログイン後' do
      it '管理画面へのアクセスが成功する' do
        login(admin)
        visit admin_root_path
      end
    end
  end

  describe '管理画面' do
    before do
      login(admin)
    end
    context '管理者ユーザ' do
      it 'ヘッダーが正しく表示されていること' do
        visit admin_root_path
        expect(page).to have_content('healthy_combi')
        expect(page).to have_content('メイン料理')
        expect(page).to have_content('サブ料理')
        expect(page).to have_content('組み合わせ食品')
        expect(page).to have_content('ログアウト')
      end

      describe '新規作成' do
        it 'メイン料理の作成時入力していないならエラー' do
          visit new_admin_main_path
          fill_in 'main[name]', with: ''
          fill_in 'main[calorie]', with: ''
          fill_in 'main[sugar]', with: ''
          fill_in 'main[lipid]', with: ''
          fill_in 'main[salt]', with: ''
          click_button '送信'
          expect(page).to have_content 'メイン料理の作成に失敗しました'
          expect(page).to have_content '商品名を入力してください'
          expect(page).to have_content 'カロリーを入力してください'
          expect(page).to have_content '炭水化物を入力してください'
          expect(page).to have_content '脂質を入力してください'
          expect(page).to have_content '塩分を入力してください'
        end
        it 'サブ料理の作成時入力していないならエラー' do
          visit new_admin_sub_path
          fill_in 'sub[name]', with: ''
          fill_in 'sub[calorie]', with: ''
          fill_in 'sub[sugar]', with: ''
          fill_in 'sub[lipid]', with: ''
          fill_in 'sub[salt]', with: ''
          click_button '送信'
          expect(page).to have_content 'サブ料理の作成に失敗しました'
          expect(page).to have_content '商品名を入力してください'
          expect(page).to have_content 'カロリーを入力してください'
          expect(page).to have_content '炭水化物を入力してください'
          expect(page).to have_content '脂質を入力してください'
          expect(page).to have_content '塩分を入力してください'
        end
        it 'メイン料理の作成に成功' do
          visit new_admin_main_path
          attach_file "main[image]", "app/javascript/images/noimage.jpg"
          fill_in 'main[name]', with: 'スパゲティ'
          fill_in 'main[calorie]', with: '500'
          fill_in 'main[sugar]', with: '70'
          fill_in 'main[lipid]', with: '20'
          fill_in 'main[salt]', with: '5'
          find('#main_stores').find("option[value='seven']").select_option
          find('#main_genre').find("option[value='noodle']").select_option
          click_button '送信'
          expect(page).to have_content 'メイン料理を追加しました'
        end
        it 'サブ料理の作成に成功' do
          visit new_admin_sub_path
          attach_file "sub[image]", "app/javascript/images/noimage.jpg"
          fill_in 'sub[name]', with: 'スパゲティ'
          fill_in 'sub[calorie]', with: '500'
          fill_in 'sub[sugar]', with: '70'
          fill_in 'sub[lipid]', with: '20'
          fill_in 'sub[salt]', with: '5'
          find('#sub_stores').find("option[value='seven']").select_option
          click_button '送信'
          expect(page).to have_content 'サブ料理を追加しました'
        end
      end
      
      describe '編集ページ' do
        context '編集に失敗する' do
          it 'メイン料理の更新に失敗' do
            visit edit_admin_main_path(main.id)
            fill_in 'main[name]', with: ''
            fill_in 'main[calorie]', with: ''
            fill_in 'main[sugar]', with: ''
            fill_in 'main[lipid]', with: ''
            fill_in 'main[salt]', with: ''
            click_button '送信'
            expect(page).to have_content '更新に失敗しました'
            expect(page).to have_content '商品名を入力してください'
            expect(page).to have_content 'カロリーを入力してください'
            expect(page).to have_content '炭水化物を入力してください'
            expect(page).to have_content '脂質を入力してください'
            expect(page).to have_content '塩分を入力してください'
          end
          it 'サブ料理の更新に失敗' do
            visit edit_admin_sub_path(sub.id)
            fill_in 'sub[name]', with: ''
            fill_in 'sub[calorie]', with: ''
            fill_in 'sub[sugar]', with: ''
            fill_in 'sub[lipid]', with: ''
            fill_in 'sub[salt]', with: ''
            click_button '送信'
            expect(page).to have_content '更新に失敗しました'
            expect(page).to have_content '商品名を入力してください'
            expect(page).to have_content 'カロリーを入力してください'
            expect(page).to have_content '炭水化物を入力してください'
            expect(page).to have_content '脂質を入力してください'
            expect(page).to have_content '塩分を入力してください'
          end
        end

        context '編集に成功する' do
          it 'メイン料理の更新に成功' do
            visit edit_admin_main_path(main.id)
            attach_file "main[image]", "app/javascript/images/noimage.jpg"
            fill_in 'main[name]', with: 'スパゲティ'
            fill_in 'main[calorie]', with: '500'
            fill_in 'main[sugar]', with: '70'
            fill_in 'main[lipid]', with: '20'
            fill_in 'main[salt]', with: '5'
            find('#main_stores').find("option[value='seven']").select_option
            find('#main_genre').find("option[value='noodle']").select_option
            click_button '送信'
            expect(page).to have_content '更新に成功しました'
          end

          it 'サブ料理の更新に成功' do
            visit edit_admin_sub_path(sub.id)
            attach_file "sub[image]", "app/javascript/images/noimage.jpg"
            fill_in 'sub[name]', with: 'スパゲティ'
            fill_in 'sub[calorie]', with: '500'
            fill_in 'sub[sugar]', with: '70'
            fill_in 'sub[lipid]', with: '20'
            fill_in 'sub[salt]', with: '5'
            find('#sub_stores').find("option[value='seven']").select_option
            click_button '送信'
            expect(page).to have_content '更新に成功しました'
          end
        end

        context 'メイン料理とサブ料理の削除に成功する' do
          it 'メイン料理の削除' do
            visit admin_main_path(main.id)
            sleep 1 # 削除処理が完了するまで待機
            click_button '削除'
            expect(page.accept_confirm).to eq '本当に削除してもよろしいですか？'
            expect(page).to have_content '削除しました'
          end
          it 'サブ料理の削除' do
            visit admin_sub_path(sub.id)
            sleep 1 # 削除処理が完了するまで待機
            click_button '削除'
            expect(page.accept_confirm).to eq '本当に削除してもよろしいですか？'
            expect(page).to have_content '削除しました'
          end
        end
      end
    end
  end
end