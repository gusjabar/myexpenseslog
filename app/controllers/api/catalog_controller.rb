class API::CatalogController < ApplicationController

  def getSubcategories
    @category = Category.all.find(params[:id])
    render :json => @category.to_json(:include => :Subcategory)
  end
end