class PostsController < ApplicationController
  
  get '/posts' do
    "A list of publically available posts"
    "You are logged in as #{session[:email]}"
  end 
  
  #here is what you can't do if you're not logged in
  get 'posts/new' do
  #checking if they are logged in 
    if !logged_in?
      redirect "/login"     #redirecting if they are not
    else 
      "A new post form" #rendering if they ARE
    end
  end
  
  
  get '/posts/:id/edit' do
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