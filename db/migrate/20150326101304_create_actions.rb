class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :employee_id
      t.string :type, limit: 1
      t.timestamps
    end
  end
end
