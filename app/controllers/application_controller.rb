require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do
    if logged_in?
      redirect "/places"
    else
      erb :signup
    end
  end

  post '/signup' do
    user = User.new(:name => params[:name], :hometown => params[:hometown], :password => params[:password])
    if user.save
      session[:user_id] = user.id
      binding.pry
      redirect "/places"
    else
      redirect "/signup"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(:id => session[:user_id])
    end
  end

end
