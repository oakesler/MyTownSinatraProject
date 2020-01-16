class PostsController < ApplicationController
  
  get '/posts' do
    "A list of publically available posts"
    "You are logged in as #{session[:email]}"
  end 
  
  #here is what you can't do if you're not logged in
  get 'posts/new' do
  #checking if they are logged in 
    if session[:email].empty?
      redirect "/login"     #redirecting if they are not
    else 
      "A new post form" #rendering if they ARE
    end
  end
end