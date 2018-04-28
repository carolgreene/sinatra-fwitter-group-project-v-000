require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :'homepage'
  end

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
    redirect '/users/index'
  end


end
