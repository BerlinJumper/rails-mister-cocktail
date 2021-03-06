class DosesController < ApplicationController

  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(cocktail)
  end

private

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

end
