class AddUniqueContraintToEmployee < ActiveRecord::Migration
  def change
    add_index :employees, [:code], unique: true
  end
end
