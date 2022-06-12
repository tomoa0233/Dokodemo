require 'rails_helper'

RSpec.describe 'Userモデルのテスト' do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user)}

    context 'name' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
    end
  end
end