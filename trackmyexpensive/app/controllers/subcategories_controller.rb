class SubcategoriesController < ApplicationController

  def index
    @subcategories = Subcategory.all
  end
  def show
    @subcategory = Subcategory.find(params[:id])
  end
  def new
    @subcategory = Subcategory.new()
  end
  def edit
    @subcategory = Subcategory.find(params[:id])
  end
  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update_attributes(subcategory_params)
      flash[:success] = "subCategory success!"
      redirect_to subcategories_path(@subcategory)
    else
      render 'new'
    end
  end
  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:success] = "subCategory success!"
      redirect_to (@subcategory)
    else
      render 'new'
    end
  end
  def destroy
    Subcategory.find(params[:id]).destroy
    flash[:success] = "Subcategory deleted"
    redirect_to subcategories_path
  end
  private
  def subcategory_params
    #params.require(:subcategory).permit(:Name, :categories_id)

    params.require(:subcategory).permit(:Name,:category_id)

  end
end
