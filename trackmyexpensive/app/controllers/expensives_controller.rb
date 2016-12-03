class ExpensivesController < ApplicationController
  before_action :set_expensife, only: [:show, :edit, :update, :destroy]

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
    @expensife = Expensive.new
  end

  # GET /expensives/1/edit
  def edit
  end

  # POST /expensives
  # POST /expensives.json
  def create
    @expensife = Expensive.new(expensife_params)

    respond_to do |format|
      if @expensife.save
        format.html { redirect_to @expensife, notice: 'Expensive was successfully created.' }
        format.json { render :show, status: :created, location: @expensife }
      else
        format.html { render :new }
        format.json { render json: @expensife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expensives/1
  # PATCH/PUT /expensives/1.json
  def update
    respond_to do |format|
      if @expensife.update(expensife_params)
        format.html { redirect_to @expensife, notice: 'Expensive was successfully updated.' }
        format.json { render :show, status: :ok, location: @expensife }
      else
        format.html { render :edit }
        format.json { render json: @expensife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expensives/1
  # DELETE /expensives/1.json
  def destroy
    @expensife.destroy
    respond_to do |format|
      format.html { redirect_to expensives_url, notice: 'Expensive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expensife
      @expensife = Expensive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expensife_params
      params.require(:expensife).permit(:amount, :logdate, :note, :category_id, :subcategory_id)
    end
end
