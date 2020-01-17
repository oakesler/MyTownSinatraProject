class CityController < Sinatra::Base
  
  get "/cities" do 
    @guides = Guide.all
    @users = User.all
    @cities = City.all
    erb :"cities/index"
  end
end
