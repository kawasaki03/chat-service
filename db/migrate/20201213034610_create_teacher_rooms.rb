class CreateTeacherRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_rooms do |t|
     t.string :name,null:false
     t.references :student, foreign_key: true
     t.string :teacher_id,null:false
     t.timestamps
    end

    add_foreign_key :teacher_rooms, :teachers
    add_index :teacher_rooms, :teacher_id
    
  end
end
