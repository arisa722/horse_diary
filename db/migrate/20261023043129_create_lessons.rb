class CreateLessons < ActiveRecord::Migration[8.1]
  def change
    create_table :lessons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :horse, foreign_key: true
      t.references :instructor, foreign_key: true
      t.date :date, null: false
      t.text :instruction
      t.text :impression
      t.text :next_goal
      t.boolean :is_public, null: false, default: false

      t.timestamps
    end
  end
end
