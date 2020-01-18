class GuidesController < ApplicationController
    
  get '/guides' do
    @guides = Guide.all
    @cities = City.all
    @users = User.all
    
    erb :"guides/index"
  end 
  
  #these next two might be in the wrong order...
  #get '/:user/guides' do 
    #@user = User.find_by(name: params[:user])
    #erb :
  #end
    
  post "/guides/:id" do 
    #binding.pry
    @user = User.find(params[:id])
    if params[:city].keys.include?("city_ids")
      params["city"]["city_ids"].each do |item|
        @city = City.find(item)
      end
    else
      @city = City.create(name: params["city"]["name"])
      @city.save
    end
    @guide = Guide.new(name: params["guide"]["name"], user_id: params[:id], city_id: @city.id)
    #-------------------------------------------------------------------#
    #LOCATION 1
    if !!params["location_one"][["location_type_ids"]
      @location_type_1 = LocationType.find(params[:location_type_ids][0])
    else 
      @location_type_1 = LocationType.create(params["location_1"]["location_type"])
    end
    @location_type_1.save
    if params[:location_1].keys.include?("location_name_ids")
      params["location_1"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_one = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, description: params["location_1"]["description"], location_type_id: params["location_1"]["location_type"])
      end
    else 
      @location_1 = Location.new(name: params["location_1"]["name"], address: params["location_1"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_1"]["description"], location_type_id: params["location_1"]["location_type"])
    end
    @location_1.save
    #-------------------------------------------------------------------#
    #LOCATION 2
    if !!params["location_two"][["location_type_ids"]
      @location_type_two = LocationType.find(params[:location_type_ids][0])
    else 
      @location_type_two = LocationType.create(params["location_2"]["location_type"])
    end
    @location_type_two.save
    if params[:location_2].keys.include?("location_name_ids")
      params["location_2"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_two = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, description: params["location_2"]["description"], location_type_id: params["location_2"]["location_type"])
      end
    else 
      @location_2 = Location.new(name: params["location_2"]["name"], address: params["location_2"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_2"]["description"], location_type_id: params["location_2"]["location_type"])
    end
    @location_2.save
    #-------------------------------------------------------------------#
    #LOCATION 3
    if !!params["location_two"][["location_type_ids"]
      @location_type_three = LocationType.find(params["location_3"]["location_type_ids"][0])
    else 
      @location_type_three = LocationType.create(params["location_3"]["location_type"])
    end
    @location_type_three.save
    if params[:location_3].keys.include?("location_name_ids")
      params["location_3"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_3 = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, description: params["location_3"]["description"], location_type_id: params["location_3"]["location_type"])
      end
    else 
      @location_3 = Location.new(name: params["location_3"]["name"], address: params["location_3"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_3"]["description"], location_type_id: params["location_3"]["location_type"])
    end
    @location_3.save
    @guide.save
    erb :"guides/view"
  end
 
  #-#-#-#
  
  get '/guides/:id/new' do
    @user = User.find(params[:id])
    @cities = City.all
    @locations = Location.all
    @location_types = LocationType.all
    erb :"guides/new"
  end
  #-#-#-#-
 
  
  #post ':user/guides/new' do
    #@user = User.find(params[:id])
    #@user.name = params[:name]
    #@user.bio = params[:bio]
    #@user.save
    #@cities = City.all
    #erb :"guides/new"
  #end
  
  patch '/guides/:id' do
    a = {}
    @user = User.find(params[:id])
    @guide = Guide.find_by(user_id: params[:id])
    if !!params["guide"]["name"]
      a[:name] = params["figure"]["name"]
      @guide.update(a)
    end
    b = {}
    if !!params[:city].keys.include?("city_ids")
      b[:title_ids] = params["figure"]["title_ids"]
      @figure.update(b)
    end
    if !!params["guide"]["city_name"]
    #if params["guide"]["city"] != ""
      City.new(name: params["figure"]["title"])
      @guide.city_id << City.new(name: params["figure"]["title"])
    end
    c = {}
    if @landmark.name != params["landmark"]["name"]
      c[:name] = params["landmark"]["name"]
      @landmark.update(c)
    end
    d = {}
    d[:figure_id] = params[:id]
    if params[:figure].keys.include?("landmark_ids")
      params["figure"]["landmark_ids"].each do |item|
        x = Landmark.find(item)
        x.update(d)
      end
    end
    redirect "/figures/#{@figure.id}"
  end
end
    
  
  #post '/guides/:id' do 
    #erb :"users/profile.rb"
  #end
 