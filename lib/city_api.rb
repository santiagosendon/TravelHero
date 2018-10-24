module CityApi
  require 'rest-client'
  require 'json'

  def google_api_fetch
      @city_data =  JSON.parse(RestClient.get(https://maps.googleapis.com/maps/api/geocode/json?address= AIzaSyA3sRU8kFZgR2L7JX08eWVbA4b8tBxt3E8))
  end

  # https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY

  def gather_api_city_data
    google_api_fetch
    address = @city_data["results"][0]["address_components"]
      if self.name = ["long_name"]
        self.latitude = @city_data["results"][0]["geometry"]["location"]["lat"]
        self.longitude = @city_data["results"][0]["geometry"]["location"]["lng"]
      end
    end


# end
