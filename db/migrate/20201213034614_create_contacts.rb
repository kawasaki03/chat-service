class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :content
      t.boolean :is_user,default:false,null: false
      t.references :admin_room, foreign_key: true
      t.timestamps
    end
  end
end
