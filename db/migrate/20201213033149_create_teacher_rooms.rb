class CreateTeacherRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_rooms do |t|
     t.string :name,null:false
     t.references :student, foreign_key: true
     t.references :teacher, foreign_key: true
     t.timestamps
    end
  end
end
