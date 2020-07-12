class PlacesController < ApplicationController

  # GET: /places
  get "/places" do
    if logged_in?
      @places = Place.all
      erb :"/places/index"
    else
      login_error
    end
  end

  # GET: /places/new
  get "/places/new" do
    if logged_in?
      erb :"/places/new"
    else
      login_error
    end
  end

# GET: /places/5
  get "/places/:id" do
    if logged_in?
      @place = Place.find_by(id: params[:id])
      erb :"/places/show"
    else
      login_error
    end
  end

  # GET: /places/5/edit
  get "/places/:id/edit" do
    #TODO separate the errors
    @place = Place.find_by(id: params[:id])
    if !logged_in?
      login_error
    elsif !@place.user_ids.include?(current_user.id)
      flash[:error] = "You can only edit places that you created"
      redirect "/places/#{@place.id}"
    else
      erb :"/places/edit"
    end
  end
  # POST: /places

  post "/places" do
    country = Country.find_or_create_by(name: params[:country])
    city = City.find_or_create_by(name: params[:city], country_id: country.id)
    place = Place.new(name: params[:name], city_id: city.id)
    if !place.users.include?(current_user)
      place.users << current_user
    end
    if place.save
      redirect "/places"
    else
      flash[:error] = "All fields must be filled out to save a new place"
      redirect "/places/new"
    end
  end

  # PATCH: /places/5
  patch "/places/:id" do
    country = Country.find_or_create_by(name: params[:country])
    city = City.find_or_create_by(name: params[:city], country_id: country.id)
    place = Place.find_by(id: params[:id])
    place.name = params[:name]
    place.city_id = city.id
    if place.save
      redirect "/places/#{place.id}"
    else
      flash[:error] = "All fields must be filled out to save changes"
      redirect "/places/#{place.id}/edit"
    end
  end

  # DELETE: /places/5/delete
  delete "/places/:id" do
    place = Place.find_by(id: params[:id])
    if place.user_ids.include?(current_user.id)
      place.destroy
      redirect "/places"
    end
  end
end
