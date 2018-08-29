PLACES_API_BASE = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"


  def set_place
    avg_lat = 35.6338503
    avg_lng = 139.7082281
    params = {
    location: "#{avg_lat},#{avg_lng}",
    radius: 700,
    type: "restaurant",
    maxprice: 2,
    key: ENV["GOOGLE_API_SERVER_KEY"],
    }
    lookup_url = PLACES_API_BASE + URI.encode_www_form(params)
    # p lookup_url
    # puts lookup_url
    data = JSON.parse(open(lookup_url).read)
    results = data["results"]
    result = results.sample
    client = GooglePlaces::Client.new(ENV["GOOGLE_API_SERVER_KEY"])

    gmaps_place_id = result["place_id"]
    # self.gmaps_place_id = gmaps_place_id
    spot = client.spot(gmaps_place_id)
    # top_photo =  result["photos"][0]
    # set_photo(top_photo["photo_reference"])
    # p result
    # p result["geometry"]
    # self.latitude = result["geometry"]["location"]["lat"]
    # self.longitude = result["geometry"]["location"]["lng"]
    # self.venue_name = result["name"]
    # self.vicinity = result["vicinity"]
    # self.latitude = result.geometry.location.lat
    # self.longitude = result.geometry.location.lng
    # self.venue_name = result.name
    # self.vicinity = result.vicinity

    spot.photos.each {|photo| p photo.photo_reference; p photo.html_attributions; puts}

    # spot = client.spot(gmaps_place_id)
    # self.photo_url = spot.photos[0].fetch_url(800)

    # self.photo_reference = top_photo["photo_reference"]
  end

  set_place
