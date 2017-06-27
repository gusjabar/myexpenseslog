class RemoveIndexCategoryFromSubcategories < ActiveRecord::Migration[5.0]
  def change
    remove_index :accounts, name: :index_subcategories_on_Category_id
    remove_index :accounts, name: :index_subcategories_on_category_id
  end
end
