require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe '講師新規登録機能' do
    before do
      @teacher = FactoryBot.build(:teacher)
      @teacher.image = nil
      @teacher.status_message = ""
    end

    context '新規登録ができる時' do
      it "name,email,password,passwordconfirmationが存在すれば登録できること" do
      expect(@teacher).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nameが空では登録できないこと' do
        @teacher.name = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("名前を入力してください")
      end
      it 'eamilが空では登録できないこと' do
        @teacher.email = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'eamilに@が含まれていないと登録できないこと' do
        @teacher.email = "1122"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空では登録できないこと' do
        @teacher.password = ""
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが7文字以下では登録できないこと' do
        @teacher.password = "abcd123"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
      it 'passwordが数字のみでは登録できないこと' do
        @teacher.password = "12345678"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
      end
      it 'passwordが英字のみでは登録できないこと' do
        @teacher.password = "abcdefgh"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
      end
      it 'passwordとpasswordconfirmationが不一致では登録できないこと' do
        @teacher.password_confirmation = "a"
        @teacher.valid?
        expect(@teacher.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end
  describe '講師マイページ編集機能' do
    before do
      @teacher = FactoryBot.build(:teacher)
    end
    context 'アップデートができる時' do
      it 'image,status_messageが存在すれば登録できること' do
       expect(@teacher).to be_valid
      end
    end
    context 'アップデートができない時' do
      it 'status_messageが50字以上だと登録できないこと' do
        @teacher.status_message = "こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは"
       @teacher.valid?
       expect(@teacher.errors.full_messages).to include("メッセージは50文字以内で入力してください")
      end
    end
  end
end
