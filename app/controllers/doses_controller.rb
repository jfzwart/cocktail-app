class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new]

  # GET /doses or /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1 or /doses/1.json
  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
    @dose = Dose.find(params[:id])
  end

  # POST /doses or /doses.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'New dose was created'
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1 or /doses/1.json
  def update
    @dose = Dose.find(params[:id])
    if @dose.update(dose_params)
      redirect_to dose_path(@dose), notice: 'Dose was updated'
    else
      render :edit
    end
  end

  # DELETE /doses/1 or /doses/1.json
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
  
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
