class UsersController < ApplicationController
  
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
    @users = User.all
    erb :"users/index"
  end
  
  post "/users/:id" do 
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.bio = params[:bio]
    @user.save
    erb :"users/view"
  end
  
    
  get '/users/:id/edit' do 
    @user = User.find(params[:id])
    #do we use current_user here?
    erb :"users/edit"
  end
  
  get '/users/:id/' do
    @user = User.find(params[:id])
    if !@user.name
      erb :"users/new"
    else 
      erb :"users/view"
    end
  end
  
  patch '/users/:id' do
    binding.pry
    @user = User.find(params[:id])
    @user.update(params["user"])
    @user.save
    erb :"/users/view"
  end
end
  