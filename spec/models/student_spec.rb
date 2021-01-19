require 'rails_helper'

RSpec.describe Student, type: :model do
  describe '生徒新規登録機能' do
    before do
      @student = FactoryBot.build(:student)
      @student.image = nil
      @student.status_message = ""
    end
    context '新規登録ができる時' do
      it "name,email,password,passwordconfirmation,teacher_idが存在すれば登録できること" do
      expect(@student).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nameが空では登録できないこと' do
        @student.name = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("名前を入力してください")
      end
      it 'eamilが空では登録できないこと' do
        @student.email = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'eamilに@が含まれていないと登録できないこと' do
        @student.email = "1122"
        @student.valid?
        expect(@student.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it 'passwordが空では登録できないこと' do
        @student.password = ""
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが7文字以下では登録できないこと' do
        @student.password = "abcd123"
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
      it 'passwordが数字のみでは登録できないこと' do
        @student.password = "12345678"
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
      end
      it 'passwordが英字のみでは登録できないこと' do
        @student.password = "abcdefgh"
        @student.valid?
        expect(@student.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
      end
      it 'passwordとpasswordconfirmationが不一致では登録できないこと' do
        @student.password_confirmation = "a"
        @student.valid?
        expect(@student.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'teacher_idが空では登録できないこと' do
        @student.teacher = nil
        @student.valid?
        expect(@student.errors.full_messages).to include("講師名を入力してください")
      end
    end
  end

  describe '生徒マイページ編集機能' do
    before do
      @student = FactoryBot.build(:student)
    end
    context 'アップデートができる時' do
      it 'image,status_messageが存在すれば登録できること' do
       expect(@student).to be_valid
      end
    end
    context 'アップデートができない時' do
      it 'status_messageが50字以上だと登録できないこと' do
        @student.status_message = "こんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちはこんにちは"
       @student.valid?
       expect(@student.errors.full_messages).to include("メッセージは50文字以内で入力してください")
      end
    end
  end
end
