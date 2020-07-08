class PlacesController < ApplicationController

  # GET: /places
  get "/places" do
    @places = Place.all
    erb :"/places/index"
  end

  # GET: /places/new
  get "/places/new" do
    erb :"/places/new"
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

  # GET: /places/5
  get "/places/:id" do
    @place = Place.find_by(id: params[:id])
    erb :"/places/show"
  end

  # GET: /places/5/edit
  get "/places/:id/edit" do
    @place = Place.find_by(id: params[:id])
    erb :"/places/edit"
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
    place.destroy
    redirect "/places"
  end
end
