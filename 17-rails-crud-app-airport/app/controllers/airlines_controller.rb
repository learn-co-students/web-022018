class AirlinesController < ApplicationController

  before_action :airline_find, only: [:show, :destroy]

  def new
    @airline = Airline.new
  end

  def create
    @airline = Airline.new(airline_params)

    if @airline.valid?
      @airline.save
      redirect_to(@airline)
    else
      render :new
    end

  end

  # def edit
  # end
  #
  # def update
  # end

  def index
    @airlines = Airline.all
  end

  def show
  end

  def destroy
    @airline.destroy
    redirect_to airlines_path
  end

  private

  def airline_params
    params.require(:airline).permit(:name)
  end

  def airline_find
    @airline = Airline.find(params[:id])
  end
end
