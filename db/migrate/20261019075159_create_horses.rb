class CreateHorses < ActiveRecord::Migration[8.1]
  def change
    create_table :horses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :color
      t.text :personality
      t.text :memo

      t.timestamps
    end
    add_index :horses, :name
  end
end
