
require './travel_plan.rb'
require './travel_agency.rb'
require './user.rb'
require './integer.rb'

travel_plan_params = [
  { name: "沖縄旅行", price: 10000 },
  { name: "北海道旅行", price: 20000 },
  { name: "九州旅行", price: 15000 }
]

travel_agency = Travel_agency.new(travel_plan_params)
travel_agency.disp_plan

user = User.new
user.select_plan(travel_agency.travel_plan)
user.num_of_people_input
user.departure_day_input

travel_agency.calculate_charges(user.chosen_plan, user.num_of_people, user.today, user.departure_day)
