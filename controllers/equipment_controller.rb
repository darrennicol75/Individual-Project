require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/equipment' )
require_relative( '../models/customer' )
require_relative( '../models/rental' )
require_relative( '../models/action' )
also_reload( '../models/*' )

get '/equipment' do
  @equipment = Equipment.all()
  erb ( :"equipment/index" )
end

get '/equipment/new' do
  @equipment = Equipment.all
  erb(:"equipment/new")
end

post '/equipment' do
  equipment = Equipment.new(params)
  equipment.save
  redirect to("/equipment")
end

get '/equipment/:id' do
  @equipment = Equipment.find(params['id'].to_i)
  erb(:"equipment/show")
end
