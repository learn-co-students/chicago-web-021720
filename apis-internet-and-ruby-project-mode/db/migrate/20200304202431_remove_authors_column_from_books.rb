class RemoveAuthorsColumnFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :authors, :string
  end
end
