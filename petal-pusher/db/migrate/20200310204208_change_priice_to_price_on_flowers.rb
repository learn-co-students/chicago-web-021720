class ChangePriiceToPriceOnFlowers < ActiveRecord::Migration
  def change
    rename_column :flowers, :priice, :price
  end
end
