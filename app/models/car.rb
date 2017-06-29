class Car
  #initializes car with make model year and color (setting)
  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    # @color = color
    @speed = 0
    @lights = true
    @parkingbrake = false
  end
  #gets the car object variables
  def show_car
    "Your car is a " + @year + " " + @make + " " + @model
  end
  #allows the car to accelerate if parking brake is off. Increases speed by 10.
  def accelerate
    if !@parkingbrake
      @speed += 10
    end
  end
  # #brakes car by 7mph, unless the speed is less than 7 and then decreases by 1
  def brake
    if @speed > 7
      @speed -= 7
    elsif @speed < 7 && @speed > 0
      @speed -= 1
    end
  end
  # #getting speed and converting to string.
  def show_speed
    @speed.to_s
  end
  # #turns lights on and off and gets lights variable.
  def lights
    @lights = !@lights
  end
  # #turns brake on and off and gets brake variable.
  def parkingbrake
    if @speed == 0
        @parkingbrake = !@parkingbrake
    end
  end

  # #gets color variable
  # def color
  #   @color
  # end
end
