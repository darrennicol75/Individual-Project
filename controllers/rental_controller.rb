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

post '/rentals' do
  rental = Rental.new(params)
  rental.save
  redirect to("/rentals")
end

post '/rentals/:id/delete' do
  Rental.destroy(params[:id])
  redirect to("/rentals")
end
