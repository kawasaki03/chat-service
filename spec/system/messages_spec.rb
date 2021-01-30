require 'rails_helper'

RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    @room_student = FactoryBot.create(:room_student)
  end

  context '投稿に失敗したとき' do
    it '送る値が空だと、メッセージの送信に失敗する' do
      # ログインする
      student_sign_in(@room_student.student)

      # 作成されたチャットルームへ遷移
      visit room_messages_path(@room_student.room)

      # DBに保存されていないことを確認
      expect{
        find('input[name = "commit"]').click
      }.not_to change{Message.count}
      # 元のページに戻ってくることを確認
      expect(current_path).to eq room_messages_path(@room_student.room)
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿が上手くいくと、チャットルームに遷移して、投稿した内容が表示されている' do
      # ログインする
      student_sign_in(@room_student.student)

      # 作成されたチャットルームへ遷移する
      visit room_messages_path(@room_student.room)

      # 値をテキストフォー  ムに入力する
      fill_in "content",with:"こんにちは"
      # 送信した値がDBに保存されていることを確認
      expect{
        find('input[name = "commit"]').click
      }.to change{Message.count}.by(1)
      # チャットルームに遷移していることを確認
      expect(current_path).to eq room_messages_path(@room_student.room)
      # 送信したメッセージがブラウザに反映されていることを確認
      expect(page).to have_content("こんにちは")
    end

    it '画像の投稿が上手くいくと、チャットルームに遷移して、投稿した画像が表示されている' do
      # ログインする
      student_sign_in(@room_student.student)

      # 作成されたチャットルームへ遷移
      visit room_messages_path(@room_student.room)

      # 画像選択フォームに画像を添付する
      image_path = Rails.root.join('public/images/piano.png')
      attach_file('message[image]',image_path,make_visible: true)
      # 送信した値がDBに保存されていることを確認
      expect{
        find('input[name= "commit"]').click
      }.to change{Message.count}.by(1)
      # チャットルームに遷移していることを確認
      expect(current_path).to eq room_messages_path(@room_student.room)
      # 送信した画像がブラウザに表示されていることを確認
      expect(page).to have_selector("img")

    end

    it 'テキストと画像の投稿に成功すること' do
      # ログインする
      student_sign_in(@room_student.student)

      # 作成されたチャットルームへ遷移する
      visit room_messages_path(@room_student.room)

      # 画像選択フォームに画像を添付する
      image_path = Rails.root.join('public/images/piano.png')
      attach_file('message[image]',image_path,make_visible: true)
      # 値をテキストフォームに入力する
      fill_in "content",with:"こんにちは"
      # 送信した値がDBに保存されていることを確認
      expect{
        find('input[name= "commit"]').click
      }.to change{Message.count}.by(1)
      # チャットルームに遷移していることを確認
      expect(current_path).to eq room_messages_path(@room_student.room)
      # 送信した画像とメッセージがブラウザに表示されていることを確認
      expect(page).to have_selector("img")
      expect(page).to have_content("こんにちは")
    end
  end
end