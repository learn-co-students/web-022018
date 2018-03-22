class FlightsController < ApplicationController
  def index
    @destinations = Flight.destinations
    if params[:flight]
      @flights = Flight.select {|flight| flight.destination == params[:flight][:destination]}
    else
      @flights = Flight.all
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end
end
