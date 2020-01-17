class CityController < Sinatra::Base
  
  get "/cities" do 
    erb :"cities/index"
  end
end
