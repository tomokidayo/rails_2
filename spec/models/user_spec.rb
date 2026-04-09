require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー登録のバリデーション' do
    let(:user) { build(:user) }

    context '正常系' do
      it '全ての項目が正しく入力されていれば有効' do
        expect(user).to be_valid
      end
    end

    context '異常系' do
      it '名前が空だと無効' do
        user.name = ''
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'メールが空だと無効' do
        user.email = ''
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'メールが重複していると無効' do
        create(:user, email: 'test@example.com')
        user.email = 'test@example.com'

        expect(user).to be_invalid
        expect(user.errors[:email]).to include("has already been taken")
      end

      it 'パスワードが空だと無効（create時）' do
        user.password = ''
        user.password_confirmation = ''

        expect(user).to be_invalid
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'パスワードが6文字未満だと無効' do
        user.password = '12345'
        user.password_confirmation = '12345'

        expect(user).to be_invalid
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it 'パスワードと確認用が一致しないと無効' do
        user.password = 'password'
        user.password_confirmation = 'different'

        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
