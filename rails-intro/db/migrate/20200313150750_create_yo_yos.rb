class CreateYoYos < ActiveRecord::Migration[6.0]
  def change
    create_table :yo_yos do |t|
      t.string :name
      t.string :color
      t.integer :diameter

      t.timestamps
    end
  end
end
