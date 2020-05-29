require './lib/spaces'
require './lib/bookings'
require 'sinatra/base'

class BNB < Sinatra::Base
  get '/' do
    redirect '/signin'
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    name = params['name']
    connection = PG.connect(dbname: 'makers_bnb_test') # We need to move this ruby code into the Model (MVC)
    connection.exec("INSERT INTO users (name) VALUES('#{name}')") # We need to move this ruby code into the Model (MVC)
    redirect '/spaces'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    Users.signup(name: params['name'])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Spaces.all
    @bookings = Bookings.all
    erb :'spaces/index'
  end

  post '/spaces' do
    Spaces.add(property_name: params[:property_name], bedrooms: params[:bedrooms], location: params[:location])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :"spaces/new"
  end

  get '/spaces/bookings' do
    erb :"spaces/bookings"
  end

  post '/spaces/bookings' do
    Bookings.add(property_name: params[:property_name], start_date: params[:start_date], end_date: params[:end_date])
    redirect '/spaces'
  end

  run! if app_file == $0
end
