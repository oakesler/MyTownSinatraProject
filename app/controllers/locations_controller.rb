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
  
   patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(params["user"])
    @user.save
    erb :"/users/view"
  end
end