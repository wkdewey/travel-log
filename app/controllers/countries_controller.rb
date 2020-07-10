class CountriesController < ApplicationController

  
  get "/countries" do
    @countries = Country.all
    erb :"/countries/index"
  end

  
  get "/countries/:id" do
    @country = Country.find_by_id(params[:id])
    erb :"/countries/show"
  end
end
