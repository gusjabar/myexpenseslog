class RemoveSubcategoriesIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :subcategories_id, :integer
  end
end
