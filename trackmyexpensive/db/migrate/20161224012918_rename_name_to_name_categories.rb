class RenameNameToNameCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :Name, :name
  end
end
