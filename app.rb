require 'sinatra/base'

class BNB < Sinatra::Base
  get '/' do
    redirect '/signin'
  end

  get '/signin' do
    erb :signin
  end

  get '/signup' do
    erb :signup
  end

  run! if app_file == $0
end
