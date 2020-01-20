class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "carcollection"
  end
  
  get '/' do 
    erb :index
  end
  
  get '/:id/logout' do 
    @user = User.find(params[:id])
    self.logout
  end
  
helpers do 
  def logged_in?
    !!current_user
  end
  
  def current_user
    @current_user ||= User.find_by(:email => session[:email]) if session([:email])
  end
   
  def login(email, password)
    #is the user who they claim to be?
    user = User.find_by(:email => email) 
    if user && user.authenticate(password)
      session[:email] = user.email
    else
      redirect "/login"
    end
  end
  #if i can find a user && can authenticate the password, then I will log them in 
    
  def logout
    session.clear
    #emailing them to let them know they logged out
    redirect "/"
  end
 end
end