class CreateShirts < ActiveRecord::Migration[6.0]
  def change
    create_table :shirts do |t|
      t.string :message
      t.string :color
      t.string :image
      t.decimal :price, precision: 5, scale: 2
      t.integer :creator_id

      t.timestamps
    end
  end
end
