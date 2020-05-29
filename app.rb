require './lib/spaces'
require './lib/bookings'
require './lib/users'
require 'sinatra/base'
require 'sinatra/flash'

class BNB < Sinatra::Base
  register Sinatra::Flash


  get '/' do
    redirect '/signin'
  end

  get '/signin' do
    erb :'signin'
  end

  post '/signin' do
    result = Users.signin(name: (params[:name]).capitalize, password: params[:password], user_type: params[:userType])

    if result
      redirect '/spaces'
    else
      flash[:notice] = "You must select the correct user type."
      redirect '/error_page'
  end
end

  get '/error_page' do
    erb :'error_page'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/signup' do
    Users.signup(name: (params[:name]).capitalize, password: params[:password], user_type: params[:userType])
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
    erb :'spaces/new'
  end

  get '/spaces/bookings' do
    erb :'spaces/bookings'
  end

  post '/spaces/bookings' do
    booking = Bookings.add(property_name: params[:property_name], start_date: params[:start_date], end_date: params[:end_date])
    
    if booking
      redirect '/spaces'
    else
      erb :'bookings_error_page'
    end
  end

  run! if app_file == $0
end
