class CreateLessonCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :lesson_categories do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :lesson_categories, [:lesson_id, :category_id], unique: true
  end
end
