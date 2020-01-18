class CitiesController < Sinatra::Base
  
  get "/cities" do
    @cities = City.all
    erb :"cities/all"
  end
end
