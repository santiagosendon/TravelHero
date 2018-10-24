module CityApi
  require 'rest-client'
  require 'json'

  def google_api_fetch
      @city_data =  JSON.parse(RestClient.get(INSERT URL + KEY))
  end


  def gather_api_city_data
    google_api_fetch
    address = @city_data["results"][0]["address_components"]
      if self.name = ["long_name"]
        self.latitude = @city_data["results"][0]["geometry"]["location"]["lat"]
        self.longitude = @city_data["results"][0]["geometry"]["location"]["lng"]
      end
    end


end
