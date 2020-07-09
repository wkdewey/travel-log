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
    elsif !@place.user_id.include?(current_user.id)
      flash[:error] = "You can only edit places that you created"
      redirect "/places/#{@place.id}"
    else
      erb :"/places/edit"
    end
  end
  # POST: /places

  post "/places" do
    place = Place.new(name: params[:name], city: params[:city], country: params[:country])
    place.user_ids = current_user.id
    if place.save
      redirect "/places"
    else
      flash[:error] = "All fields must be filled out to save a new place"
      redirect "/places/new"
    end
  end

  # PATCH: /places/5
  patch "/places/:id" do
    place = Place.find_by(id: params[:id])
    place.name = params[:name]
    place.city = params[:city]
    place.country = params[:country]
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
    if  place.user_ids.include?(current_user.id)
      place.destroy
      redirect "/places"
    end
  end
end
