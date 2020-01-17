class PostsController < ApplicationController
    
  get '/guides' do
    erb :"guides/index"
    #Guides.all
  end 
  
  #these next two might be in the wrong order...
  
  post '/guides/:id' do 
    erb :"users/profile.rb"
  end
  
  get 'guides/:id' do 
    erb :"users/profile"
  end
end