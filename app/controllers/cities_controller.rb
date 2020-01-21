class CitiesController < ApplicationController
  
  get "/cities" do
    @cities = City.all
    
    erb :"cities/index"
  end
end
