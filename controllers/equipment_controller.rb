require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/equipment' )
require_relative( '../models/customer' )
require_relative( '../models/rental' )
require_relative( '../models/action' )
also_reload( '../models/*' )

get '/equipment' do #index
  @equipment = Equipment.all()
  erb ( :"equipment/index" )
end

get '/equipment/new' do #new
  @equipment = Equipment.all
  erb(:"equipment/new")
end

post '/equipment' do #create
  equipment = Equipment.new(params)
  equipment.save
  redirect to("/equipment")
end

get '/equipment/:id' do #show
  @equipment = Equipment.find(params['id'].to_i)
  erb(:"equipment/show")
end

get '/equipment/:id/edit' do #edit
  @equipment = Equipment.find(params['id'])
  erb(:"equipment/edit")
end

post '/equipment/:id' do #update
  Equipment.new( params ).update
  redirect to '/equipment'
end

post '/equipment/:id/delete' do # delete
  equipment = Equipment.find( params[:id] )
  equipment.delete()
  redirect to '/equipment'
end
