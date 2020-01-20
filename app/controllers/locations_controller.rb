class LocationsController < ApplicationController
  
  get '/locations' do
    @types = LocationType.all
    @locations = Location.all
    @users = User.all
    erb :"locations/index"
  end
  
  post '/locations/view/:id' do 
    @guide = Guide.find(params[:id])
    @user = User.find(@guide.user_id)
    @city = City.find(@guide.city_id)
    erb :"guides/view"
  end
  
  get '/locations/:id/edit' do 
    @location = Location.find(params[:id])
    @types = LocationType.all
    
    erb :"locations/edit"
  end
  
   patch '/locations/:id' do
    @location = Location.find(params[:id])
    @guide = Guide.find(@location.guide_id)
    @user = User.find(@guide.user_id)
    @location.update(params["location"])
    @location.save
    erb :"/guides/view"
  end
end