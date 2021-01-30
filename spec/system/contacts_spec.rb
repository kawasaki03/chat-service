require 'rails_helper'

RSpec.describe "メッセージ投稿機能", type: :system do
  before do
    @teacher_room = FactoryBot.create(:teacher_room)
  end

  context '投稿に失敗したとき' do
    it '送る値が空だと、メッセージの送信に失敗する' do
      # ログインする
      student_sign_in(@teacher_room.student)

      # チャットルームへ遷移
      visit teacher_room_contacts_path(@teacher_room)

      # DBに保存されていないことを確認
      expect{
        find('input[name = "commit"]').click
      }.not_to change{Contact.count}
      # 元のページに戻ってくることを確認
      expect(current_path).to eq teacher_room_contacts_path(@teacher_room)
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # ログインする
      student_sign_in(@teacher_room.student)

      # チャットルームへ遷移する
      visit teacher_room_contacts_path(@teacher_room)

      # テキストフォームに入力する
      fill_in "content",with:"こんにちは"
      # 送った値がデータベースに保存されていることを確認
      expect{
        find('input[name = "commit"]').click
      }.to change{Contact.count}.by(1)
      # チャットルームに遷移していることを確認
      expect(current_path).to eq teacher_room_contacts_path(@teacher_room)
      # 送信したメッセージがブラウザに反映されていることを確認
      expect(page).to have_content("こんにちは")
    end

    it '画像の投稿に成功すると、投稿一覧に遷移して、投稿した画像が表示されている' do
      # サインインする
      student_sign_in(@teacher_room.student)

      # チャットルームへ遷移する
      visit teacher_room_contacts_path(@teacher_room)
      
      # 画像選択フォームに画像を添付
      image_path = Rails.root.join('public/images/piano.png')
      attach_file('contact[image]',image_path,make_visible: true)
      # 送った値がデータベースに保存されていることを確認
      expect{
        find('input[name= "commit"]').click
      }.to change{Contact.count}.by(1)
      #チャットルームに遷移していることを確認
      expect(current_path).to eq teacher_room_contacts_path(@teacher_room)
      # 送信した画像がブラウザに表示されていることを確認
      expect(page).to have_selector("img")

    end

    it 'テキストと画像の投稿に成功すること' do
      # サインインする
      student_sign_in(@teacher_room.student)

      # チャットルームへ遷移
      visit teacher_room_contacts_path(@teacher_room)
      
      # 画像選択フォームに画像を添付する
      image_path = Rails.root.join('public/images/piano.png')
      attach_file('contact[image]',image_path,make_visible: true)
      # 値をテキストフォームに入力する
      fill_in "content",with:"こんにちは"
      # 送信した値がDBに保存されていることを確認
      expect{
        find('input[name= "commit"]').click
      }.to change{Contact.count}.by(1)
      # チャットルームに遷移していることを確認
      expect(current_path).to eq teacher_room_contacts_path(@teacher_room)
      # 送信した画像&メッセージがブラウザに表示されていることを確認
      expect(page).to have_selector("img")
      expect(page).to have_content("こんにちは")
    end
  end
end