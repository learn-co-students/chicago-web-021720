class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :type
      t.string :color
      t.integer :priice
      t.timestamps
    end
  end
end
