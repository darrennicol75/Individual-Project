require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer' )
require_relative( '../models/equipment' )
also_reload( '../models/*' )

get '/customers' do #index
  @customers = Customer.all()
  erb ( :"customers/index" )
end

get '/customers/new' do #new
  @customers = Customer.all
  @equipment = Equipment.all
  erb(:"customers/new")
end

post '/customers' do #create
  customer = Customer.new(params)
  customer.save
  redirect to("/customers")
end

get '/customers/:id' do #show
  @customer = Customer.find(params['id'].to_i)
  erb( :"customers/show" )
end

get '/customers/:id/edit' do #edit
  @customer = Customer.find(params['id'])
  erb(:"customers/edit")
end

post '/customers/:id' do #update
  Customer.new( params ).update
  redirect to '/customers'
end

post '/customers/:id/delete' do # delete
  # binding.pry
  customer = Customer.find( params[:id] )
  customer.delete()
  erb(:"customers/confirm")
  # redirect to '/customers'
end
