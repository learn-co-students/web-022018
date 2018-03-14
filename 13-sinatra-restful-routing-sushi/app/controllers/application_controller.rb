class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get "/" do
    redirect "/sushis"
  end

  get "/sushis" do
    @sushis = Sushi.all
    erb :index
  end

  get "/sushis/new" do
    erb :new
  end

  get "/sushis/:id" do
    @sushi = Sushi.find(params[:id])
    erb :show
  end

  post "/sushis" do
    sushi = Sushi.create(params)
    redirect "/sushis/#{sushi.id}"
  end

  get "/sushis/:id/edit" do
    @sushi = Sushi.find(params[:id])
    erb :edit
  end

  patch "/sushis/:id" do
    sushi = Sushi.find(params[:id])
    sushi.update(name: params[:name], description: params[:description])
    redirect "/sushis/#{sushi.id}"
  end

  delete "/sushis/:id" do
    sushi = Sushi.find(params[:id])
    sushi.destroy
    redirect "/sushis"
  end

end
