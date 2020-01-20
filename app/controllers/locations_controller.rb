class LocationsController < ApplicationController
  
  get '/locations' do
    @types = LocationType.all
    @locations = Location.all
    @users = User.all
    erb :"locations/index"
  end
  
  get '/locations/:id/new' do
    @guide = Guide.find(params[:id])
    @user = User.find(@guide.user_id)
    @types = LocationType.all
    @locations = Location.all
    erb :"locations/new"
  end
  
  post "/locations/:id" do
    @guide = Guide.find(params[:id])
    @city = City.find(@guide.city_id)
    @user = User.find(@guide.user_id)
    if !!params["location_1"]["type"]
      @type = LocationType.create(name: params["location_1"]["type"])
    end
    if params["location_1"]["location_type_ids"] != nil
      @type = LocationType.find(params["location_1"]["location_type_ids"][0])
    end
    if params["location_1"]["location_name_ids"] != nil
      @name = Location.find(params["location_1"]["location_name_ids"][0]).name
    end
    if !!params["location_1"]["name"]
      @name = "#{params["location_1"]["name"]}"
    end

    @location = Location.create(name: @name, address: params["location_1"]["address"], city_id: "#{@city.id}" , user_id: "#{@user.id}" , guide_id: "#{@guide.id}", description: params["location_1"]["description"], location_type_id: "#{@type.id}")
    binding.pry
    erb :"guides/view"
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