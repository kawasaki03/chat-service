require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'メッセージ作成機能' do
    before do
      @contact = FactoryBot.build(:contact)
    end

    context 'メッセージ作成ができる時' do
      it 'contentとimageが存在すれば登録できること' do
        expect(@contact).to be_valid
      end
      it 'contentのみが存在すれば登録できること' do
        @contact.image = nil
        expect(@contact).to be_valid
      end
      it 'imageのみが存在すれば登録できること' do
        @contact.content = nil
        expect(@contact).to be_valid
      end
    end

    context 'メッセージ作成ができない時' do
      it 'contentとimageの両方が空だと登録できないこと' do
        @contact.content = ''
        @contact.image = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include('Contentを入力してください')
      end

      it 'teacher_roomが空だと登録できないこと' do
        @contact.teacher_room = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include('Teacher roomを入力してください')
      end
    end
  end
end
