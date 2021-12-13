require 'rails_helper'

RSpec.describe '検索機能', type: :system do
  let(:main) { create :main }

  describe 'メイン料理一覧の検索機能' do
    before do
      visit mains_path
      main
    end

    context '検索条件にある食品が表示される' do
      describe '食品名の検索検証' do
        it '該当する食品が表示されること' do
          fill_in 'q[name_cont]', with: 'メイン'
          click_on '検索'
          expect(page).to have_content(main.name)
        end
      end

      describe 'コンビニ名の検索検証' do
        it '該当する食品が表示されること' do
          find('#q_stores_eq').find("option[value='0']").select_option
          click_on '検索'
          expect(page).to have_content(main.stores_i18n)
        end
      end

      describe 'ジャンルの検索検証' do
        it '該当する食品が表示されること' do
          find('#q_genre_eq').find("option[value='0']").select_option
          click_on '検索'
          expect(page).to have_content(main.name)
        end
      end
    end
  end
end