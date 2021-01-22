require 'rails_helper'

RSpec.describe StudentRecord, type: :model do
 describe "レッスンメモ投稿機能" do
    before do
      @student_record = FactoryBot.build(:student_record)
    end

    context 'レッスンメモが投稿できる時' do
      it 'titleとnoteが存在すると投稿できる' do
        expect(@student_record).to be_valid
      end
    end
    context 'レッスンメモが投稿できない時' do
      it 'titleが空だと投稿できない' do
        @student_record.title = ""
        @student_record.valid?
        expect(@student_record.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'noteが空だと投稿できない' do
        @student_record.note = ""
        @student_record.valid?
        expect(@student_record.errors.full_messages).to include("メモを入力してください")
      end
      it 'teacherが紐づいていないと投稿できない' do
        @student_record.teacher = nil
        @student_record.valid?
        expect(@student_record.errors.full_messages).to include("Teacherを入力してください")
      end
      it 'studentが紐づいていないと投稿できない' do
        @student_record.student = nil
        @student_record.valid?
        expect(@student_record.errors.full_messages).to include("Studentを入力してください")
      end
      
      
    end

    
  end
end
