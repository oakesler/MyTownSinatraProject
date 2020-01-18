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
      erb :"guides/new"
    else
      erb :"users/profile"
    end
  end
  ##############################
  post '/users/:id' do 
    @user = User.find(params[:id])
    @city = City.new(name: params["city"]["name"])
    @guide = Guide.new(name: params["guide"]["name"], user_id: params[:id], city_id: @city.id)
    @location_1 = Location.new(name: params["location_1"]["name"], address: params["location_1"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id)
    @location_2 = Location.new(name: params["location_2"]["name"], address: params["location_2"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id )
    @location_3 = Location.new(name: params["location_3"]["name"], address: params["location_3"]["address"], city_id: @city.id, user_id: params[:id], guide_id: @guide.id)
    
    #t.string :name 
    #t.string :address 
      #t.integer :city_id
      #t.integer :user_id
      #t.integer :guide_id
      t.string :type
    
    
    
    
    
    
    @params = params
    erb :"users/profile"
  end
  ######################################
  
  post '/figures' do
    @figure = Figure.create(name: params["figure"]["name"])
    if params[:figure].keys.include?("title_ids")
      params["figure"]["title_ids"].each do |item|
        @title = Title.find(item)
        @figure.titles << @title
      end
    end
    if params["title"]["name"] != ""
      @title = Title.create(name: params["title"]["name"])
      @figure.titles << @title
    end
    #if !!params["landmark"]["name"].scan(/\w/)
    
    if params["landmark"]["name"] != "" && params["landmark"]["name"] != nil
      @landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"], figure_id: @figure.id)
      @landmark.save
    end
    if params["figure"]["landmark_ids"].length > 0
      #binding.pry
      params["figure"]["landmark_ids"].each do |id|
        @landmark = Landmark.find(id)
        #@landmark.update(figure_id: params[:id])
        @landmark.update(figure_id: @figure.id)
        @landmark.save
      end
    end
    redirect to "/figures/#{@figure.id}"
  end
  
  
  
  
  
  
  
  
  #get '/users' do 
    #erb :"users/profiles"
  #end
  
  get '/users/:id/edit' do 
    @user = User.find(params[:id])
    #do we use current_user here?
    erb :"users/edit.erb"
  end
end 
  