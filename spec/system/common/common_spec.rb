require 'rails_helper'

RSpec.describe '共通系', type: :system do
  let(:user) { create(:user) }

    context 'ヘッダーの表示' do
      before { login(user) }
      describe 'ヘッダー' do
        it 'ヘッダーが正しく表示されていること' do
          visit food_combinations_path
          expect(page).to have_content('healthy_combi')
          expect(page).to have_content('組み合わせ選択')
          expect(page).to have_content('組み合わせ一覧')
          expect(page).to have_content('組み合わせ作成')
          expect(page).to have_content('お問合せ')
        end
      end
    end
  end