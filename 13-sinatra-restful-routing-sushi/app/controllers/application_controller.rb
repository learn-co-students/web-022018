class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get "/" do
    redirect "/sushis"
  end

  get "/sushis" do
    @sushis = Sushi.all
    erb :index
  end

  get "/sushis/:id" do
    @sushi = Sushi.find(params[:id])
    erb :show
  end

end
