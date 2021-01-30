module SignInSupport
  def student_sign_in(student)
    visit student_session_path
    fill_in 'メールアドレス',with: student.email
    fill_in 'パスワード',with: student.password
    click_on("login")
    expect(current_path).to eq student_path(student.id)
  end

  def teacher_sign_in(teacher)
    visit teacher_session_path
    fill_in 'メールアドレス',with: teacher.email
    fill_in 'パスワード',with: teacher.password
    click_on("login")
    expect(current_path).to eq teacher_path(teacher.id)
  end
end