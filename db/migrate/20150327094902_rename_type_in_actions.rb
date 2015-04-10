class RenameTypeInActions < ActiveRecord::Migration
  def change
    rename_column :actions, :type, :mode
    rename_table :actions, :marks
  end
end
