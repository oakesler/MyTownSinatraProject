class SessionsController < ApplicationController
  
  get '/login' do
    erb :"sessions/login.html"
  end
  
  post '/sessions' do 
    #log in a user with this email
    #old code: session[:email] = params[:email]
    login(params[:email], params[:password])
    redirect "/posts"
  end
  
  get '/logout' do 
    session.clear
  end
end