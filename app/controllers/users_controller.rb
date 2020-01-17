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
  
  post '/user/:id' do 
    erb :"users/profile"
  end
  
  get '/users' do 
    erb :"users/profiles"
  end
  
  get '/user/:id/edit' do 
    @user = User.find(params[:id])
    #do we use current_user here?
    erb :"users/edit.erb"
  end
end 
  