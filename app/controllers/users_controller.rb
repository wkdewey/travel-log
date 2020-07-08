class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    if logged_in?
      @current_user = current_user
      @users = User.all
      erb :"/users/index"
    else
      redirect "/login"
    end
  end

  # GET: /users/new. Creating a new user can be handled by logging out and signing up again.
  get "/users/new" do
    if logged_in?
      redirect "/logout"
    else
      redirect "/login"
    end
  end

  # POST: /users This route is not applicable to this program
  # post "/users" do
  #   redirect "/users"
  # end

  # GET: /users/:id
  get "/users/:id" do
    if logged_in?
      @user = User.find_by(id: params[:id])
      erb :"/users/show"
    else
      redirect "/login"
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if logged_in?
      @user = User.find_by(id: params[:id])
      erb :"/users/edit"
    else
      redirect "/login"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    user = User.find_by(id: params[:id])
    user.name = params[:name]
    user.hometown = params[:hometown]
    user.password = params[:password]
    user.save
    redirect "/users/#{user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id" do
    if logged_in?
      user = User.find_by(id: params[:id])
      user.destroy
      session.clear
      redirect "/"
    end
  end
end
