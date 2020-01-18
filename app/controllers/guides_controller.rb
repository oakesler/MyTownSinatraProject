class PostsController < ApplicationController
    
  get '/guides' do
    @guides = Guide.all
    @cities = City.all
    erb :"guides/index"
  end 
  
  #these next two might be in the wrong order...
  
  post '/guides/:id/new' do
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.bio = params[:bio]
    @user.save
    @cities = City.all
    erb :"guides/new"
  end
    
  
  post '/guides/:id' do 
    erb :"users/profile.rb"
  end
  
  get 'guides/:id' do 
    erb :"users/profile"
  end
end