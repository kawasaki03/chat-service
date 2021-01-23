class CreateStudentRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :student_records do |t|
      t.string :title
      t.text :note
      t.references :student,foreign_key: true
      t.string :teacher_id
      t.timestamps
    end
    add_foreign_key :student_records, :teachers
    add_index :student_records, :teacher_id
  end
end
