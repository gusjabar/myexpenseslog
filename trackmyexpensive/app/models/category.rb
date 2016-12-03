class Category < ApplicationRecord
has_many :Subcategory , :inverse_of => :category

def to_s
  self.Name
end
end
