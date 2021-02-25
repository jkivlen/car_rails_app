class MakesController < ApplicationController
  def new
    @make = Make.new
    @make.cars.build
  end

  def create
    @make = Make.new(make_params)
    if @make.save
      redirect_to make_path(@make)
    else
      render :new
    end
  end

  def index
    @makes = Make.all
  end

  def show
    @make = Make.find(params[:id])
  end

  private

  def make_params
    params.require(:make).permit(:name, cars_attributes: [:color, :price, :four_wheel_drive])
  end
end
