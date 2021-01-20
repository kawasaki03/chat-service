class CreateStudentRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :student_records do |t|
      t.string :title
      t.string :note
      t.references :student,foreign_key: true
      t.references :teacher,foreign_key: true
      t.timestamps
    end
  end
end
