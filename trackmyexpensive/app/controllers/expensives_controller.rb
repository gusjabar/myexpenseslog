class ExpensivesController < ApplicationController
  before_action :set_expensive, only: [:show, :edit, :update, :destroy]

  # GET /expensives
  # GET /expensives.json
  def index
    @expensives = Expensive.all
  end

  # GET /expensives/1
  # GET /expensives/1.json
  def show
  end

  # GET /expensives/new
  def new
    @expensive = Expensive.new
  end

  # GET /expensives/1/edit
  def edit
  end

  # POST /expensives
  # POST /expensives.json
  def create
    @expensive = Expensive.new(expensive_params)

    respond_to do |format|
      if @expensive.save
        format.html { redirect_to @expensive, notice: 'Expensive was successfully created.' }
        format.json { render :show, status: :created, location: @expensive }
      else
        format.html { render :new }
        format.json { render json: @expensive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expensives/1
  # PATCH/PUT /expensives/1.json
  def update
    respond_to do |format|
      if @expensive.update(expensife_params)
        format.html { redirect_to @expensive, notice: 'Expensive was successfully updated.' }
        format.json { render :show, status: :ok, location: @expensive }
      else
        format.html { render :edit }
        format.json { render json: @expensive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expensives/1
  # DELETE /expensives/1.json
  def destroy
    @expensive.destroy
    respond_to do |format|
      format.html { redirect_to expensives_url, notice: 'Expensive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expensive
      @expensive = Expensive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expensive_params
      params.require(:expensive).permit(:amount, :logdate, :note, :category_id, :subcategory_id)
    end
end
