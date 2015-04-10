class AddTsToActions < ActiveRecord::Migration
  def change
    add_column :actions, :ts, :datetime
  end
end
