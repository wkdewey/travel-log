class CitiesController < ApplicationController

  # GET: /cities
  get "/cities" do
    @cities = City.all
    erb :"/cities/index"
  end

  # GET: /cities/5
  get "/cities/:id" do
    @city = City.find_by_id(params[:id])
    erb :"/cities/show"
  end

end
