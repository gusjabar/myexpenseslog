class RemoveAndAddReferenceCategoriesToSubcategory < ActiveRecord::Migration[5.0]
  def change
    remove_index :accounts, name: :index_subcategories_on_categories_id
    remove_column :subcategories, :categories_id, :integer
    add_reference :subcategories, :category, foreign_key: true
  end
end
