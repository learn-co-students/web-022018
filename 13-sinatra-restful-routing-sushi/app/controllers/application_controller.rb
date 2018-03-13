class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get "/" do
    erb :index
  end

end
