class Subcategory < ApplicationRecord
 belongs_to :category, :class_name => "Category", :foreign_key => "category_id"#,:inverse_of => Subcategory
  #has_one Category
  #has_one :Category , :inverse_of => Subcategory
  #has_one :category, :class_name => "Category", :foreign_key => "category_id" ,:inverse_of => Subcategory
end
