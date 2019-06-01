require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer' )
require_relative( '../models/equipment' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index" )
end

get '/customers/new' do
  @customers = Customer.all
  @equipment = Equipment.all
  erb(:"customers/new")
end

post '/customers' do
  customer = Customer.new(params)
  customer.save
  redirect to("/customers")
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb( :"customers/show" )
end
