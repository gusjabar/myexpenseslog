class AlterColumnExpensivesLogdate < ActiveRecord::Migration[5.0]
  def change
    remove_column :expensives, :logdate, :string
    add_column :expensives, :logdate, :date
  end

end
