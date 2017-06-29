class CarsController < ApplicationController
  def index
  end
  def create
    # if !params[:make] || !params[:model] || !params[:year] || !params[:color]
    #   render "index"
    # else
      @car = Car.new(params[:make], params[:model], params[:year])
      cookies[:car] = @car.to_yaml
      render "/cars/create"
    # end
  end
  def accelerate
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def lights
    @car = YAML.load(cookies[:car])
    @car.lights
    cookies[:car] = @car.to_yaml
    render "create.html.erb"
  end
  def parkingbrake
    @car = YAML.load(cookies[:car])
    @car.parkingbrake
    cookies[:car] = @car.to_yaml
    render "create.html.erb"
  end
end
