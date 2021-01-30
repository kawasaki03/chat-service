require 'rails_helper'

RSpec.describe "チャットルーム削除機能", type: :system do
  before do
    @teacher_room = FactoryBot.create(:teacher_room)
  end
  it "チャットルームを削除すると、作成されたメッセージが全て削除される" do
  # サインイン＆チャットルーム遷移
    student_sign_in(@teacher_room.student)
  visit teacher_room_contacts_path(@teacher_room)

  # message作成
  FactoryBot.create_list(:contact,3,teacher_room_id: @teacher_room.id,is_student: true)

  # 「チャット削除」ボタンを押すとメッセージが全て削除される
  expect{
    find_link("チャット削除",href: teacher_room_path(@teacher_room)).click
  }.to change{@teacher_room.contacts.count}.by(-3)
  # チャットルームページに遷移する
  expect(current_path).to eq teacher_rooms_path
  end
end