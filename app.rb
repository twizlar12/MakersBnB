require './lib/spaces'
require './lib/users'
require 'sinatra/base'

class BNB < Sinatra::Base
  get '/' do
    redirect '/signin'
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    Users.signin(name: params[:name], password: params[:password], user_type: params[:userType])
    redirect '/spaces'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    Users.signup(name: params[:name], password: params[:password], user_type: params[:userType])
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Spaces.all
    # @bookings = Bookings.all
    erb :'spaces/index'
  end

  post '/spaces' do
    Spaces.add(bedrooms: params[:bedrooms], location: params[:location])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :"spaces/new"
  end

  run! if app_file == $0
end
