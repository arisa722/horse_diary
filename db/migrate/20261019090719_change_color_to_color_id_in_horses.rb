class ChangeColorToColorIdInHorses < ActiveRecord::Migration[8.1]
  def change
    remove_column :horses, :color, :string
    add_reference :horses, :color, foreign_key: true
  end
end
