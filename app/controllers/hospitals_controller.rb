require 'geokit'

class HospitalsController < ApplicationController
  def index
    #my_location = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip)
    my_location = Geokit::Geocoders::MultiGeocoder.geocode(request.env["HTTP_X_FORWARDED_FOR"])
    puts my_location
    @hospitals = Hospital.all.sort_by{|h| Geokit::LatLng.new(h.latitude, h.longitude).distance_to(my_location)}
  end
end
