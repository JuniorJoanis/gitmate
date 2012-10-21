require 'open-uri'
module Gmap
  GEOCODE_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address="
  def geocode address
    return false if address.nil? || address.blank?
    puts address
    query = GEOCODE_URL + CGI.escape(address).to_s
    json_object = JSON.parse(open(query).read)
      puts "===Query #{query}"
     puts "=============GEOCODE =====   ====="
    puts json_object["results"].first["geometry"]["location"]
    return json_object["results"].first["geometry"]["location"]
  end
end