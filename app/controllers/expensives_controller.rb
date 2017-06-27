class ExpensivesController < ApplicationController
  before_action :set_expensive, only: [:show, :edit, :update, :destroy]

  # GET /expensives
  # GET /expensives.json
  def index

    @filterrific = initialize_filterrific(
        Expensive,
        params[:filterrific],
        select_options: {
            sorted_by: Expensive.options_for_sorted_by,
            with_category_id: Category.options_for_select
        },
        persistence_id: 'shared_key',
        default_filter_params: {}
    ) or return
    @expensives = Expensive.filterrific_find(@filterrific).page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end

  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{ e.message }"
    redirect_to(reset_filterrific_url(format: :html)) and return
  end

  # GET /expensives/1
  # GET /expensives/1.json
  def show
  end

  # GET /expensives/new...

  def new
    @expensive = Expensive.new
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @expensive }
    end
  end

  # GET /expensives/1/edit
  def edit
  end

  # POST /expensives
  # POST /expensives.json
  def create
    @expensive = Expensive.new(expensive_params)

    if @expensive.save

      #format.html { redirect_to index, notice: 'Expense was successfully created.' }
      #format.html { render action: 'index', status: :created, location: @expensives }
      #format.json { render action: 'index', status: :created, location: @expensives }
      # added:
      #format.js { render action: 'index', status: :created, location: @expensives}
      redirect_to expensives_url
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @expensive.errors, status: :unprocessable_entity }
        format.js { render json: @expensive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expensives/1
  # PATCH/PUT /expensives/1.json
  def update

    if @expensive.update(expensive_params)
      #format.html { redirect_to @expensive, notice: 'Expensive was successfully updated.' }
      #format.json { render :show, status: :ok, location: @expensive }
      redirect_to expensives_url
    else
      respond_to do |format|
        #format.html { render :edit }
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
