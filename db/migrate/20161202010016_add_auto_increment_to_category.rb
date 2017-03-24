class AddAutoIncrementToCategory < ActiveRecord::Migration[5.0]
  def change
    #add_column :categories, :Category_id, :primary_key , :unique=>true, :null => false, :auto_increment => true
    #change_column :categories, :Category_id,:primary_key , :unique=>true, :null => false
    change_column :categories,:Category_id, :integer, :auto_increment => true
  end
end
