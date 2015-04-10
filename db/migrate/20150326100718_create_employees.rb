class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :code
      t.string :name, limit: 100

      t.timestamps
    end
  end
end
