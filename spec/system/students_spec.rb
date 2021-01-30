require 'rails_helper'

RSpec.describe "生徒ログイン機能", type: :system do
  it 'ログインしていない状態でチャットルームにアクセスした場合、サインインページに移動する' do
    # サインインが必要なページに遷移する
    @student = FactoryBot.create(:student)
    @student.image = nil
    @student.status_message = ""
    visit student_path(@student.id)
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_student_session_path
  end

  it 'ログインに成功し、ユーザー詳細ページに遷移する' do
    # 予め、ユーザー（生徒）をDBに保存する
    @student = FactoryBot.create(:student)
    @student.image = nil
    @student.status_message = ""
    # サインインページへ移動する
    visit student_session_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_student_session_path
    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'メールアドレス',with: @student.email
    fill_in 'パスワード',with: @student.password
    # ログインボタンをクリックする
    find('input[name="commit"]').click
    # 詳細ページに遷移していることを確認する
    expect(current_path).to eq student_path(@student.id)
  end

  it 'ログインに失敗し、再びサインインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @student = FactoryBot.create(:student)
    @student.image = nil
    @student.status_message = ""
    # サインインが必要なページに遷移する
    visit student_path(@student.id)
    # ログインしていない場合、サインインページに遷移していることを確認する
    expect(current_path).to eq new_student_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'メールアドレス',with: @student.email
    fill_in 'パスワード',with: "password"
    # ログインボタンをクリックする
    find('input[name="commit"]').click
    # サインインページに戻ってきていることを確認する
    expect(current_path).to eq new_student_session_path
  end


end