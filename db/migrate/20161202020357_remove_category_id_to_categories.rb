class RemoveCategoryIdToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :Category_id, :integer
  end
end
