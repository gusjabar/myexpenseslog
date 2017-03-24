class RemoveColumnCategoryIdFromSubcategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcategories, :Category_id, :integer
    remove_column :subcategories, :category_id, :integer
    add_column :subcategories, :categories_id, :integer
  end
end
