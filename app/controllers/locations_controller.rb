class LocationsController < Sinatra::Base 
  
  get '/locations' do 
    erb :"locations/index"
  end
  
end