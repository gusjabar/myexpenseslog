class SubcategoriesController < ApplicationController

  def index
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
  end

  def new
    @subcategory = Subcategory.new()
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @subcategory }
    end

  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    @subcategory = Subcategory.find(params[:id])

    if @subcategory.update_attributes(subcategory_params)
      flash[:success] = "subCategory success!"
    #  redirect_to subcategories_path(@subcategory)
    #else
    #  render 'new'
    end
    redirect_to categories_url
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:success] = "subCategory success!"
    #  redirect_to (@subcategory)
    #else
    #  render 'new'
    end
    redirect_to categories_url
  end

  def destroy
    item = Subcategory.find(params[:id])

    respond_to do |format|
      if item.destroy
        msg = {status: :ok, :message => "Success!", html: "<b>Done!</b>"}
        format.json { render json: msg }
      else
        format.json { render json: item.errors, status: :unprocessable_entity }
      end

    end
  end

  private
  def subcategory_params
    #params.require(:subcategory).permit(:Name, :categories_id)

    params.require(:subcategory).permit(:Name, :category_id)

  end
end

