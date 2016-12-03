class API::CatalogController < ApplicationController

  def getSubcategories
    @category = Category.all
    render :json => @category.to_json(:include => :Subcategory)
  end
end