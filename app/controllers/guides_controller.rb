class GuidesController < ApplicationController
    
  get '/guides' do
    @guides = Guide.all
    @cities = City.all
    erb :"guides/index"
  end 
  
  #these next two might be in the wrong order...
  #get '/:user/guides' do 
    #@user = User.find_by(name: params[:user])
    #erb :
  #end
    
  post "/guides/view/:id" do 
    @user = User.find(params[:id])
    if params[:city].keys.include?("city_ids")
      params["city"]["city_ids"].each do |item|
        @city = City.find(item)
      end
    else
      @city = City.new(name: params["city"]["name"])
    end
    @city.save
    @guide = Guide.new(name: params["guide"]["name"], user_id: params[:id], city_id: @city.id)
    @guide.save
    if params[:location_1].keys.include?("location_name_ids")
      params["location_1"]["location_name_ids"].each do |item|
        temp_location = Location.find(item)
        @location_1 = Location.new(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, type: params["location_1"]["type"])
      end
    else 
      @location_1 = Location.new(name: params["location_1"]["name"], address: params["location_1"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, type: params["location_1"]["type"])
    end
    @location_2.save
    #-------------------------------------------------------------------#
    if params[:location_1].keys.include?("location_name_ids")
      params["location_1"]["location_name_ids"].each do |item|
        temp_location = Location.find(item)
        @location_1 = Location.new(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, type: params["location_1"]["type"])
      end
    else 
      @location_2 = Location.new(name: params["location_2"]["name"], address: params["location_2"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, type: params["location_2"]["type"])
    end
    @location_2.save
    #-------------------------------------------------------------------#
    if params[:location_3].keys.include?("location_name_ids")
      params["location_3"]["location_name_ids"].each do |item|
        temp_location = Location.find(item)
        @location_3 = Location.new(name: "#{temp_location.name}", address: "#{temp_location.address}", city_id: temp_location.city_id, user_id: params[:id], guide_id: @guide.id, type: params["location_1"]["type"])
      end
    else 
      @location_3 = Location.new(name: params["location_3"]["name"], address: params["location_3"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id, type: params["location_3"]["type"])
      @location_3.save
    end
    @location_3.save
    @params = params
    erb :"guides/view"
  end
  
  post '/guides/:id/new' do
    @user = User.find(params[:id])
    erb :"guides/new"
  end
  
  post 'guides/view/:id' do 
    
end
  
  #post ':user/guides/new' do
    #@user = User.find(params[:id])
    #@user.name = params[:name]
    #@user.bio = params[:bio]
    #@user.save
    #@cities = City.all
    #erb :"guides/new"
  #end
    
  
  post '/guides/:id' do 
    erb :"users/profile.rb"
  end
  
  get 'guides/:id' do 
    erb :"users/profile"
  end
end