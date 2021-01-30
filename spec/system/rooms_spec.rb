require 'rails_helper'

RSpec.describe 'メッセージ投稿機能', type: :system do
  before do
    @room_student = FactoryBot.create(:room_student)
  end
  it 'チャットルームを削除すると、作成されたメッセージが全て削除される' do
    # サインイン＆チャットルーム遷移
    student_sign_in(@room_student.student)
    visit room_messages_path(@room_student.room)

    # message作成
    FactoryBot.create_list(:message, 3, room_id: @room_student.room.id, student_id: @room_student.student.id)

    # 「チャット削除」のボタンを押すとメッセージが全て削除される
    expect do
      find_link('チャット削除', href: room_path(@room_student.room)).click
    end.to change { @room_student.room.messages.count }.by(-3)
    # チャットルームページに遷移する
    expect(current_path).to eq rooms_path
  end
end
