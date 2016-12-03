class AddAutoIncrementCategoryIdToCategory < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :Category_id,:integer, auto_increment: true
  end
end
