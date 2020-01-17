class PostsController < ApplicationController
  
  
  get "/profile" do 
    erb :"users/profile"
  end
    
  get '/guides' do
    erb :"guides/index"
    #Guides.all
  end 
  
  get '/guides/:id/edit' do
    #checking if they are logged in 
    if !logged_in?
      redirect '/login' #redirecting if not logged in 
    else 
      #how do i find the posts that should only be edited by this user/author?
      if postie = current_user.posts.find_by(params[:id])
        "An edit post form #{current_user.id} is editing #{post.id}" #taking them here if logged in
      else 
        redirect '/posts'
      end
    end
  end
end