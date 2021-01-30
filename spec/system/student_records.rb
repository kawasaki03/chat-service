require 'rails_helper'

RSpec.describe "メモ投稿機能", type: :system do
  before do
    @student_record = FactoryBot.create(:student_record)
  end

  context '投稿に失敗したとき' do
    it '送る値が空だと、メッセージの送信に失敗する' do
      # ログインする
      teacher_sign_in(@student_record.teacher)

      # レッスンメモページへ遷移
      visit student_records_path(@student_record.student)

      # DBに保存されていないことを確認
      expect{
        find('input[name = "commit"]').click
      }.not_to change{StudentRecord.count}
      # 元のページに戻ってくることを確認
      expect(current_path).to eq student_records_path(@student_record.student)
    end
  end

  # bundle exec rspec spec/system/student_records.rb

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # ログインする
      teacher_sign_in(@student_record.teacher)

      # レッスンメモページへ遷移
      visit student_records_path(@student_record.student)

      # テキストフォームに入力する
      fill_in "title",with:"こんにちは"
      fill_in "note",with:"こんにちは"
      # 送った値がデータベースに保存されていることを確認
      expect{
        find('input[name = "commit"]').click
      }.to change{StudentRecord.count}.by(1)
      # レッスンメモページに遷移していることを確認
      expect(current_path).to eq student_records_path(@student_record.student)
      # 送信したメッセージがブラウザに反映されていることを確認
      expect(page).to have_content("こんにちは")
    end

  
  end
end