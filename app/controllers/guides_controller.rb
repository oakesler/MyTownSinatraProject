class GuidesController < ApplicationController
    
  get '/guides' do
    @guides = Guide.all
    @cities = City.all
    @users = User.all
    @types = LocationType.all
    erb :"guides/index"
  end 
  
  get "/guides/:id" do 
    @guide = Guide.find(params[:id])
    @user = User.find(@guide.user_id)
    @city = City.find(@guide.city_id)
    @types = LocationType.all
    erb :"guides/view"
  end
    
  post "/guides/:id" do 
    @user = User.find(params[:id])
    if !!params[:city].keys.include?("city_ids")
      @city = City.find(params["city"]["city_ids"][0])
      elsif !!City.find_by(name: params["city"]["name"])
      @city = City.find_by(name: params["city"]["name"])
    else
      @city = City.create(name: params["city"]["name"])
    end
    if !!Guide.find_by(name: params["guide"]["name"], user_id: @user.id)
      @guide = Guide.create(name: "#{params["guide"]["name"]}_(Note: You already have a guide with this name!)", user_id: params[:id], city_id: @city.id)
    else
      @guide = Guide.create(name: params["guide"]["name"], user_id: params[:id], city_id: @city.id)
    end
    #LOCATION 1#
    if params["location_1"].include?("location_type_ids")
      @location_type_1 = LocationType.find(params[:location_1][:location_type_ids][0])
    else 
      @location_type_1 = LocationType.create(name: params["location_1"]["type"])
    end
    if params[:location_1].keys.include?("location_name_ids") 
      params["location_1"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_one = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: "#{temp_location.city_id}", user_id: params[:id], guide_id: "#{@guide.id}", description: params["location_1"]["description"], location_type_id: @location_type_1.id)
      end
    else 
      @location_1 = Location.create(name: params["location_1"]["name"], address: params["location_1"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_1"]["description"], location_type_id: @location_type_1.id)
    end
    #-------------------------------------------------------------------#
    #LOCATION 2
    if params["location_2"].include?("location_type_ids")
      @location_type_two = LocationType.find(params[:location_2][:location_type_ids][0])
    else 
      @location_type_two = LocationType.create(name: params["location_2"]["type"])
    end
    if params[:location_2].keys.include?("location_name_ids")
      params["location_2"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_two = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, description: params["location_2"]["description"], location_type_id: @location_type_two.id)
      end
    else 
      @location_2 = Location.create(name: params["location_2"]["name"], address: params["location_2"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_2"]["description"], location_type_id: @location_type_two.id)
    end
    #-------------------------------------------------------------------#
    #LOCATION 3
    if params["location_3"].include?("location_type_ids")
      @location_type_three = LocationType.find(params["location_3"]["location_type_ids"][0])
    else 
      @location_type_three = LocationType.create(name: params["location_3"]["type"])
    end
    if params[:location_3].keys.include?("location_name_ids")
      params["location_3"]["location_name_ids"].each do |item|
        temp_location= Location.find(item)
        @location_3 = Location.create(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, description: params["location_3"]["description"], location_type_id: @location_type_three.id)
      end
    else 
      @location_3 = Location.create(name: params["location_3"]["name"], address: params["location_3"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, description: params["location_3"]["description"], location_type_id: @location_type_three.id)
    end
    @types = LocationType.all
    erb :"guides/view"
  end
  
  get '/guides/:id/new' do
    @user = User.find(params[:id])
    @cities = City.all
    @locations = Location.all
    @location_types = LocationType.all
    erb :"guides/new"
  end
  
  get '/guides/:id/edit' do 
    @guide = Guide.find(params[:id])
    @city = City.find(@guide.city_id)
    @user = User.find(@guide.user_id)
    @locations = @guide.locations
    @cities = City.all
    erb :"guides/edit"
  end
  #post ':user/guides/new' do
    #@user = User.find(params[:id])
    #@user.name = params[:name]
    #@user.bio = params[:bio]
    #@user.save
    #@cities = City.all
    #erb :"guides/new"
  #end
  
    #patch '/users/:id' do
    #@user = User.find(params[:id])
    #@user.update(params["user"])
    #@user.save
    #erb :"/users/view"
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
 