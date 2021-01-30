require 'rails_helper'

RSpec.describe "講師ログイン機能", type: :system do
  it 'ログインしていない状態でチャットルームにアクセスした場合、サインインページに移動する' do
    # ログインが必要なページに遷移する
    visit teacher_rooms_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_teacher_session_path
  end

  it 'ログインに成功し、ユーザー詳細ページに遷移する' do
    # 予め、ユーザー（講師）をDBに保存する
    @teacher = FactoryBot.create(:teacher)
    @teacher.image = nil
    @teacher.status_message = ""
    # サインインページへ移動する
    visit teacher_rooms_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_teacher_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'メールアドレス',with: @teacher.email
    fill_in 'パスワード',with: @teacher.password
    # ログインボタンをクリックする
    click_on("login")
    # 詳細ページに遷移していることを確認する
    expect(current_path).to eq teacher_path(@teacher.id)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @teacher = FactoryBot.create(:teacher)
    @teacher.image = nil
    @teacher.status_message = ""
    # ログインが必要なページに遷移する
    visit teacher_rooms_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_teacher_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'メールアドレス',with: @teacher.email
    fill_in 'パスワード',with: "password"
    # ログインボタンをクリックする
    click_on("login")
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_teacher_session_path
  end


end