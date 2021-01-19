require 'rails_helper'

RSpec.describe TeacherRoom, type: :model do
  describe 'チャットルーム新規作成機能' do
    before do
      @teacher_room = FactoryBot.build(:teacher_room)
    end
    context 'チャットルーム作成ができる時' do
      it "nameが存在すれば登録できること" do
      expect(@teacher_room).to be_valid
      end
    end

    context 'チャットルーム作成ができない時' do
      it 'nameが空では登録できないこと' do
        @teacher_room.name = ""
        @teacher_room.valid?
        expect(@teacher_room.errors.full_messages).to include("Nameを入力してください")
      end
      it 'teacherが紐づいていないと登録できないこと' do
        @teacher_room.teacher = nil
        @teacher_room.valid?
        expect(@teacher_room.errors.full_messages).to include("Teacherを入力してください")
      end
      it 'studentが紐づいていないと登録できないこと' do
        @teacher_room.student = nil
        @teacher_room.valid?
        expect(@teacher_room.errors.full_messages).to include("Studentを入力してください")
      end


     
    end
  end
end
