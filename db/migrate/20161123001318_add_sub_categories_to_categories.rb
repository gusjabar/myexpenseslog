class AddSubCategoriesToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :subcategories_id, :integer
  end
end
