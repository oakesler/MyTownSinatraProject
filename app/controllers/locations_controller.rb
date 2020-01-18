class LocationsController < Sinatra::Base 
  
  get '/locations' do 
    erb :"locations/index"
  end
  
  post '/locations/view/:id' do 
    @guide = Guide.find(params[:id])
    @user = User.find(@guide.user_id)
    @city = City.find(@guide.city_id)
    erb :"guides/view"
  end
  
end