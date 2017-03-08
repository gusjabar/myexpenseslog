class Category < ApplicationRecord
  has_many :Subcategory, :inverse_of => :category

  def to_s
    self.name
  end

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end

end
