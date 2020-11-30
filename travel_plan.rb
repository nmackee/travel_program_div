class Travel_plan
  attr_reader :name, :price, :id

  @@count = 0
  def initialize(**travel_plan_params)
    @name = travel_plan_params[:name]
    @price = travel_plan_params[:price]
    @id = @@count += 1
  end

end
