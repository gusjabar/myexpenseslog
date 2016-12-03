class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.references :Category
      t.string :Name

      t.timestamps
    end
  end
end
