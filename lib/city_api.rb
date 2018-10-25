# module CityApi
#   require 'rest-client'
#   require 'json'
#
#   def google_api_fetch
#     google_url = "https://maps.googleapis.com/maps/api/geocode/json?address="
#       @city_data =  JSON.parse(RestClient.get(google_url + AIzaSyDUva4GdFJ5TsIbm5NgzNksacOvqDwEpW0))
#   end
#
#
#   def gather_api_city_data
#     google_api_fetch
#     address = @city_data["results"][0]["address_components"]
#       if self.name = ["long_name"]
#         self.latitude = @city_data["results"][0]["geometry"]["location"]["lat"]
#         self.longitude = @city_data["results"][0]["geometry"]["location"]["lng"]
#       end
#     end
#
#
# end
