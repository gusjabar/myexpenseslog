class RemoveColumncategoriesIdFromSubcategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcategories, :categories_id, :integer
    add_column :subcategories, :category_id, :integer, :reference =>:categories
  end
end
