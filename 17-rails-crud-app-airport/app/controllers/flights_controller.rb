class FlightsController < ApplicationController
  def index
    if params[:flight]
      @flights = Flight.all.select {|flight| flight.destination == params[:flight][:destination]}
    else
      @flights = Flight.all
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
