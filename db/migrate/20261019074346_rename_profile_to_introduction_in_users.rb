class RenameProfileToIntroductionInUsers < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :profile, :introduction
  end
end
