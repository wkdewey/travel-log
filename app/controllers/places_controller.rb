class PlacesController < ApplicationController

  # GET: /places
  get "/places" do
    if logged_in?
      @places = Place.all
      erb :"/places/index"
    else
      redirect "/login"
    end
  end

  # GET: /places/new
  get "/places/new" do
    if logged_in?
      erb :"/places/new"
    else
      redirect "/login"
    end
  end

# GET: /places/5
  get "/places/:id" do
    if logged_in?
      @place = Place.find_by(id: params[:id])
      erb :"/places/show"
    else
      redirect "/login"
    end
  end

  # GET: /places/5/edit
  get "/places/:id/edit" do
    @place = Place.find_by(id: params[:id])
    if logged_in? && current_user.id == @place.user_id
      
      erb :"/places/edit"
    else
      redirect "/login"
    end
  end
  # POST: /places

  post "/places" do
    place = Place.new(name: params[:name], city: params[:city], country: params[:country], user_id: current_user.id)
    if place.save
      redirect "/places"
    else
      redirect "/places/new"
    end
  end

  # PATCH: /places/5
  patch "/places/:id" do
    place = Place.find_by(id: params[:id])
    place.name = params[:name]
    place.city = params[:city]
    place.country = params[:country]
    place.save
    redirect "/places/#{place.id}"
  end

  # DELETE: /places/5/delete
  delete "/places/:id" do
    place = Place.find_by(id: params[:id])
    if logged_in? && current_user.id == place.user_id
      place.destroy
      redirect "/places"
    end
  end
end
