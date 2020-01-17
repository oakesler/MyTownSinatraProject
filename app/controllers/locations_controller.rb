class LocationsController < Sinatra::Base 
  
  get '/cities' do 
    erb :"locations/index"
  end
  
end