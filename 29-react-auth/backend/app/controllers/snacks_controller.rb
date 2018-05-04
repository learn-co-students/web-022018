 class SnacksController < ApplicationController

  def index
    if logged_in?
      render json: Snack.all
    else
      render json: { go_away: true }
    end
  end

end
