class LaptopsController < ApplicationController

  get "/laptops" do
    @laptops = Laptop.all
    erb :"laptops/index"
  end

  get "/laptops/:id" do
    @laptop = Laptop.find(params[:id])
    erb :"laptops/show"
  end
end
