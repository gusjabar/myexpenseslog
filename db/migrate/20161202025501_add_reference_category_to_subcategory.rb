class AddReferenceCategoryToSubcategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :subcategories, :category_id, :integer
    add_reference :subcategories, :category, foreign_key: true
  end
end
