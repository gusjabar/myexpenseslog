class CreateExpensives < ActiveRecord::Migration[5.0]
  def change
    create_table :expensives do |t|
      t.decimal :amount
      t.string :logdate
      t.text :note
      t.references :category, foreign_key: true
      t.references :subcategory, foreign_key: true

      t.timestamps
    end
  end
end
