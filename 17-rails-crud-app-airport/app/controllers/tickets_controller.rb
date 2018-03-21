class TicketsController < ApplicationController

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to passenger_path(@ticket.passenger_id)
    else
      redirect_to flight_path(@ticket.flight_id)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:passenger_id, :flight_id)
  end
end
