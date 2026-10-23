class CreateInstructors < ActiveRecord::Migration[8.1]
  def change
    create_table :instructors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.text :feature
      t.text :memo

      t.timestamps
    end
  end
end
