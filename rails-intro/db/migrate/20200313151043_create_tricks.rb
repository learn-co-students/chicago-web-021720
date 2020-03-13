class CreateTricks < ActiveRecord::Migration[6.0]
  def change
    create_table :tricks do |t|
      t.string :title
      t.integer :duration
      t.integer :yo_yo_id

      t.timestamps
    end
  end
end
