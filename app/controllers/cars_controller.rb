class CarsController < ApplicationController
  before_action :set_car, :redirect_if_not_owner, only: [:show, :edit, :update, :destroy]
  before_action :current_user_exists, only: [:create]


  def new
    if params[:make_id] && @make = Make.find_by_id(params[:make_id])
      @car = @make.cars.build
    else
      @car = Car.new
      @car.build_make
    end

    
  end

  def create
    @car = current_user.cars.build(car_params)
    binding.pry
    if @car.save
      redirect_to car_path(@car)
    else
      @make = Make.find_by_id(params[:make_id]) if params[:make_id]
      render :new
    end
  end

  def index
    if params[:make_id] && @make = Make.find_by_id(params[:make_id])
      @cars = @make.cars
    else
      @cars = Car.all
    end
  end

  def show
  end

  def edit
   
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def expensive
    @car = Car.ordered_by_price.first
  end

  def search
    if params[:search].blank?
      @cars = Car.all
    else
      @cars = Car.joins(:make).search(params[:search])
       @cars
    end
  end

  
  private

  def car_params
    params.require(:car).permit(:price, :color, :four_wheel_drive, :user_id, :make_id, make_attributes: [:name])
  end

  def redirect_if_not_owner
    if current_user != @car.user
      flash[:message] = "This is not your car.  You can only edit your own cars."
      redirect_to cars_path
    end
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def current_user_exists
    if current_user
      current_user
    else
      flash[:message] = "Need to be logged in to add cars. Please log in"
      redirect_to '/login'
    end
  end
end
