class ChangeTypeToKindOnFlowers < ActiveRecord::Migration
  def change
    rename_column :flowers, :type, :kind
  end
end
