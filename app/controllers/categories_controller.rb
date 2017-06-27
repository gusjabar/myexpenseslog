class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
  end
  def new
    @category = Category.new()
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:sucess] = "Category success!"
      redirect_to @category
    else
      render 'new'
    end
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:sucess] = "Category success!"
      redirect_to @category
    else
      render 'new'
    end
  end
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_path
  end
  private
  def category_params
    params.require(:category).permit(:name, :subcategory)
  end
end
