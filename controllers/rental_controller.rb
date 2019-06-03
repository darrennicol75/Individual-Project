require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/rental' )
require_relative( '../models/customer' )
require_relative( '../models/equipment' )
require_relative( '../models/action' )
also_reload( '../models/*' )


get '/rentals' do
  @rentals = Rental.all
  @actions = Action.all
  erb ( :"rentals/index" )
end

get '/rentals/new' do
  @customers = Customer.all
  @equipment = Equipment.all
  erb(:"rentals/new")
end

post '/rentals' do #rental that reduces the inventory count
  @rental = Rental.new(params)
  @rental.save()
  @customer = Customer.find(params['customer_id'])
  @equipment = Equipment.find(params['equipment_id'])
  @equipment.quantity -= 1 #need to link this dynamically.
  @equipment.update()
  erb(:"rentals/confirm")
end

post '/rentals/returns' do #return that adds back to stock
  @customer = Customer.find(params['customer_id'])
  @equipment = Equipment.find(params['equipment_id'])
  @equipment.quantity += 1
  @equipment.update()
  erb(:"rentals/returns")
end

post '/rentals/:id/delete' do
  Rental.destroy(params[:id])
  redirect to '/rentals'
end

get '/rentals/:id/edit' do
  @rental = Rental.find(params["id"])
  binding.pry
  @customer = Customer.find(@rental.customer_id)
  erb(:"rentals/edit")
end
