class LocationsController < Sinatra::Base 
  
  get '/user_locations' do 
    erb :"locations/city_index"
  end
  
  get '/city_locations' do 
    erb :"locations/city_index"
  end
  
  get 'locations'
  
end