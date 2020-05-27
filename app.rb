require './lib/spaces'
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
    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO users (name) VALUES('#{name}')")
    redirect '/spaces'
  end

  get '/signup' do
    erb :signup
  end

  get '/spaces' do
    @spaces = Spaces.all
    erb :'spaces/index'
  end

  post '/spaces' do
    Spaces.add(property_name: params['property_name'])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :"spaces/new"
  end

  run! if app_file == $0
end
