class City < ApplicationRecord
  has_many :trips
  has_many :users, through: :trips
  has_many :reviews, through: :trips
  validates :name, uniqueness: true, presence: true

  KEY = "AIzaSyDHo4oNRgoF_vXpEaq7R_6M1RCyyPiQaqo"

  # method to send request to fetch geocode location of a city
  def google_api_fetch
    google_url = "https://maps.googleapis.com/maps/api/geocode/json?address="

    JSON.parse(RestClient.get(google_url + self.name + "&" + KEY))
  end

  # method to update longitude/latitude for a city record
  def gather_api_city_data
    @city_data = google_api_fetch
    address = @city_data["results"][0]["address_components"][0]
    if self.name = address["long_name"]
      self.latitude = @city_data["results"][0]["geometry"]["location"]["lat"]
      self.longitude = @city_data["results"][0]["geometry"]["location"]["lng"]
    end
  end

  # makes a request to a search query
  def google_api_nearby_search
    # requires key, location (lat, long), and radius (defined in meters within. Max is 50,000 meters).
    google_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
    location = "location=#{self.latitude},#{self.longitude}"
    radius = "radius=400"

    JSON.parse(RestClient.get(google_url + location + "&" + radius + "&key=" + KEY))
  end

  # makes a request to obtain more details after making a search request
  def google_api_place_details
     # requires key and place_id (from a search request)
    @location = google_api_nearby_search
    google_url = "https://maps.googleapis.com/maps/api/place/details/json?"
    place_id = "placeid=#{@location["results"][0]["place_id"]}"
    JSON.parse(RestClient.get(google_url + "&" + place_id + "&key=" + KEY))
  end

  def gather_api_photo_data
    # requires key, photoreference, and max_height or max_width
    @request = google_api_place_details
    google_url = "https://maps.googleapis.com/maps/api/place/photo?"
    max_width = "maxwidth=400"
    @photos = []
    @request["result"]["photos"].each.with_index do |photo_link, index|
      photo_reference = "photoreference=#{@request["result"]["photos"][index]["photo_reference"]}"
      @photos << "#{google_url}&#{max_width}&#{photo_reference}&key=#{KEY}"
    end
    @photos
  end



end
