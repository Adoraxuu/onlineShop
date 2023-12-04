class AddDeletedAtToProd < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :deleted_at, :datetime
    add_index :products, :deleted_at  #rails API有說明 建索引
  end
end
