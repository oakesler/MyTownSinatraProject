class UsersController < ApplicationController
  
  ########## THIS IS ALL SIGN UP ###############
  get '/signup' do 
    erb :'users/new.html'
  end
  
  post '/users' do 
    @user = User.new 
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect "/login"
    else 
      erb :'users/new.html'
    end
  end
  ##########THIS IS ALL SIGN UP ###################
  
  get '/users' do 
    erb :"users/index"
  end
  
  get '/users/:id/' do
    @user = User.find(params[:id])
    if !@user.name
      erb :"users/new"
      elsif @user.guides.count == 0 || nil
      @cities = City.all
      @locations = Location.all
      @location_types = LocationType.all
      erb :"guides/new"
    else
      erb :"users/profile"
    end
  end
  ##############################
  post '/users/:id' do 
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
    erb :"users/profile"
  end
    
    #if params[:figure].keys.include?("title_ids")
      #params["figure"]["title_ids"].each do |item|
        #@title = Title.find(item)
        #@figure.titles << @title
      #end
    #end
  ######################################
  
  #post '/figures' do
    #@figure = Figure.create(name: params["figure"]["name"])
    #if params[:figure].keys.include?("title_ids")
      #params["figure"]["title_ids"].each do |item|
        #@title = Title.find(item)
        #@figure.titles << @title
      #end
    #end
    #if params["title"]["name"] != ""
      #@title = Title.create(name: params["title"]["name"])
      #@figure.titles << @title
    #end

    
    #if params["landmark"]["name"] != "" && params["landmark"]["name"] != nil
      #@landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"], figure_id: @figure.id)
      #@landmark.save
    #end
    #if params["figure"]["landmark_ids"].length > 0
      
      #params["figure"]["landmark_ids"].each do |id|
        #@landmark = Landmark.find(id)
        #@landmark.update(figure_id: @figure.id)
        #@landmark.save
      #end
    #end
    #redirect to "/figures/#{@figure.id}"
  #end
  
  
  
  
  
  
  
  
  #get '/users' do 
    #erb :"users/profiles"
  #end
  
  get '/users/:id/edit' do 
    @user = User.find(params[:id])
    #do we use current_user here?
    erb :"users/edit.erb"
  end
end 
  