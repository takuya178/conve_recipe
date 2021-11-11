require 'rails_helper'

RSpec.describe Main, type: :model do
  let(:main) { create(:main) }

  context '各項目が未入力の場合' do
    it "メイン食品名が空白ならエラー" do
      

    end
  end
end
