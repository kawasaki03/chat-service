require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ作成機能' do
    before do
      @message= FactoryBot.build(:message)
    end
    
    context 'メッセージ作成ができる時' do
      it "contentとimageが存在すれば登録できること" do
      expect(@message).to be_valid
      end
      it "contentのみが存在すれば登録できること" do
      @message.image = nil
      expect(@message).to be_valid
      end
      it "imageのみが存在すれば登録できること" do
      @message.content = nil
      expect(@message).to be_valid
      end
    end
    context 'メッセージ作成ができない時' do
      it "contentとimageの両方が空だと登録できないこと" do
      @message.content = ""
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Contentを入力してください")
      end
      it "roomが空だと登録できないこと" do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Roomを入力してください")
      end
      it "studentが空だと登録できないこと" do
      @message.student = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Studentを入力してください")
      end
    end
  end
    # context '新規登録ができない時' do
    #   it 'nameが空では登録できないこと' do
    #     @message.name = ""
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("名前を入力してください")
    #   end
    #   it 'eamilが空では登録できないこと' do
    #     @message.email = ""
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("メールアドレスを入力してください")
    #   end
    #   it 'eamilに@が含まれていないと登録できないこと' do
    #     @message.email = "1122"
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("メールアドレスは不正な値です")
    #   end
    #   it 'passwordが空では登録できないこと' do
    #     @message.password = ""
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("パスワードを入力してください")
    #   end
    #   it 'passwordが7文字以下では登録できないこと' do
    #     @message.password = "abcd123"
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("パスワードは8文字以上で入力してください")
    #   end
    #   it 'passwordが数字のみでは登録できないこと' do
    #     @message.password = "12345678"
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
    #   end
    #   it 'passwordが英字のみでは登録できないこと' do
    #     @message.password = "abcdefgh"
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("パスワードは半角の英字・数字を両方含んでください")
    #   end
    #   it 'passwordとpasswordconfirmationが不一致では登録できないこと' do
    #     @message.password_confirmation = "a"
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
    #   end
    #   it 'teacher_idが空では登録できないこと' do
    #     @message.teacher = nil
    #     @message.valid?
    #     expect(@message.errors.full_messages).to include("講師名を入力してください")
    #   end
    # end
  end

