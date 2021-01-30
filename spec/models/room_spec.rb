require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'チャットルーム新規作成機能' do
    before do
      @room = FactoryBot.build(:room)
    end
    context 'チャットルーム作成ができる時' do
      it 'nameが存在すれば登録できること' do
        expect(@room).to be_valid
      end
    end

    context 'チャットルーム作成ができない時' do
      it 'nameが空では登録できないこと' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('Nameを入力してください')
      end
    end
  end
end
