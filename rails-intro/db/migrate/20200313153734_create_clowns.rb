class CreateClowns < ActiveRecord::Migration[6.0]
  def change
    create_table :clowns do |t|
      t.string :name
      t.integer :age
      t.string :phrase
      t.boolean :is_cool

      t.timestamps
    end
  end
end
