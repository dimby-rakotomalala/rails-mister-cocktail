class DosesController < ApplicationController
  def new
    # Add code
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    # Add code
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :amount, :cocktail_id, :ingredient_id)
  end
end
