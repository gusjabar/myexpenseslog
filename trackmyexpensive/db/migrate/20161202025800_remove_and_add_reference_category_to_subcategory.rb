class RemoveAndAddReferenceCategoryToSubcategory < ActiveRecord::Migration[5.0]
  def change
    remove_index :accounts, name: :index_subcategories_on_category_id
    remove_column :subcategories, :category_id, :integer
    add_reference :subcategories, :categories, foreign_key: true
  end
end
