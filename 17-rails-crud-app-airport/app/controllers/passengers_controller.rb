class PassengersController < ApplicationController
  before_action :get_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.all
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to @passenger
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @passenger.update(passenger_params)
      redirect_to @passenger
    else
      render :edit
    end
  end

  def destroy
    @passenger.destroy
    redirect_to passengers_path
  end

  private

  def passenger_params
    params.require(:passenger).permit(:name, :luggage)
  end

  def get_passenger
    @passenger = Passenger.find(params[:id])
  end
end
