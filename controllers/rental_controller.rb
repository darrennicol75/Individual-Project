require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/rental' )
require_relative( '../models/customer' )
require_relative( '../models/equipment' )
require_relative( '../models/action' )
also_reload( '../models/*' )


get '/rentals' do #index
  @rentals = Rental.all
  @actions = Action.all
  erb ( :"rentals/index" )
end

get '/rentals/new' do #new
  @customers = Customer.all
  @equipment = Equipment.all
  erb(:"rentals/new")
end

post '/rentals' do #create
  @rental = Rental.new(params)
  @rental.save()
  @customer = Customer.find(params['customer_id'])
  @equipment = Equipment.find(params['equipment_id'])
  @equipment.quantity -= 1
  @equipment.update()
  erb(:"rentals/confirm")
end

# post '/rentals/:id/returns' do
# @rental = Rental.find(params['id'].to_i)
#
#   binding.pry
#   @customer = Customer.find(params['customer_id'])
#   @equipment = Equipment.find(params['equipment_id'])
#   @equipment.quantity += 1
#   @equipment.update()
#   erb(:"rentals/returns")
# end

get '/rentals/:id' do #show
  @rental = Rental.find(params['id'].to_i)
  @equipment = Equipment.find(@rental.equipment_id)
  # binding.pry
  erb(:"rentals/show")
end

get '/rentals/:id/edit' do #edit
  @rental = Rental.find(params['id'])
  erb(:"rentals/edit")
end

post '/rentals/:id' do #update
  Rental.new( params ).update
  redirect to '/rentals'
end

post '/rentals/:id/delete' do # delete
# find the rental and delete from the database
  rental= Rental.find( params[:id] )
  rental.delete()
  # find the equipment from the rental
  equipment = Equipment.find(rental.equipment_id)
  # get the quantity of things rented out
  amount_to_return = rental.quantity
  # use an attr acessor to change the equipment's quantity
  equipment.quantity += amount_to_return
  # update the equipment
  equipment.update()
  erb(:"rentals/offhire")
  # redirect to '/rentals/confirm'
end




# get '/rentals/:id/edit' do
#   @rental = Rental.find(params["id"])
#   # binding.pry
#   @customer = Customer.find(@rental.customer_id)
#   erb(:"rentals/edit")
# end
