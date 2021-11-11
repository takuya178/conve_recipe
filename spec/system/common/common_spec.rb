require 'rails_helper'

RSpec.describe '共通系', type: :system do
  let(:user) { create(:user) }

  describe 'ヘッダーの表示' do
    context 'ログイン前' do
      before { visit root_path }
      describe 'ヘッダー' do
        it 'ヘッダーが正しく表示されていること' do
          expect(page).to have_content('組み合わせ選択')
          expect(page).to have_content('ログイン'), 'ヘッダーに「ログイン」というテキストが表示されていません'
          expect(page).to have_content('使い方説明')
        end
      end
    end

    context 'ログイン後' do
      before { login(user) }
      describe 'ヘッダー' do
        it 'ヘッダーが正しく表示されていること' do
          visit food_combinations_path
          expect(page).to have_content('healthy_combi')
          expect(page).to have_content('組み合わせ選択')
          expect(page).to have_content('組み合わせ一覧')
          expect(page).to have_content('組み合わせ作成')
          expect(page).to have_content('お問合せ')
          expect(page).to have_content('ログアウト')
        end
      end
    end
  end
end