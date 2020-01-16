class ApplicationController < Sinatra::Base  
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
  end
  
 helpers do 
   
   def logged_in?
     !!session[:email]
   end
   
   def login(email)
     #is the user who they claim to be?
     session[:email] = email
  end
  
  def logout
    session.clear
    #emailing them to let them know they logged out
    redirect "/posts"
  end
   
 end
end