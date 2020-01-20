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
    if params["location"]["location_type_id"] == ""
      @type = LocationType.find(params["location"]["location_types"][0])
    else 
      @type = LocationType.create(name: params["location"]["location_type_id"])
    end
    @location = Location.find(params[:id])
    @guide = Guide.find(@location.guide_id)
    @user = User.find(@guide.user_id)
    @city = City.find(@guide.city_id)
    hash = {:id => "#{@location.id}", :name => params["location"]["name"], :address => params["location"]["address"], :city_id => "#{@city.id}", :user_id => "#{@user.id}", :guide_id => "#{@guide.id}", :description => params["location"]["description"], :location_type_id => "#{@type.id}"}
    @location.update(hash)
    @location.save
    erb :"/guides/view"
  end
end