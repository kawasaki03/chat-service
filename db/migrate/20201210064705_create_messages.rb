class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.boolean :checked, default: false, null: false
      t.references :room, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
