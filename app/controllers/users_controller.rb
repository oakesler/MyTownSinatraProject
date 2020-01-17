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
    else 
      erb :"users/profile"
    end
  end
  
  post '/users/:id' do 
    @user = User.find(params[:id])
    erb :"users/profile"
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
  