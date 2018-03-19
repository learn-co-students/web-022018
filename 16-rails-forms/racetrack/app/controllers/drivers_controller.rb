class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
    #form_for calls @driver.name to prepopulate the form
  end

  def create
    # @driver = Driver.new(driver_params)
    # if @driver.valid?
      # @driver.save
    # else
      # flash etc
    # end

    @driver = Driver.create(driver_params)
    if @driver.valid?
      redirect_to @driver
    else
      flash[:error] = @driver.errors.full_messages
      redirect_to new_driver_path
      # render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    # you can also do @driver = Driver.update(driver_params)

    @driver = Driver.find(params[:id])
    @driver.update(driver_params)

    if @driver.valid?
      redirect_to @driver
    else
      flash[:error] = @driver.errors.full_messages
      redirect_to edit_driver_path(@driver)
    end

  end

  def destroy
    Driver.destroy(params[:id])

    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name)
  end
end
