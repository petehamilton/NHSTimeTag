class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
    puts @hospitals.inspect
  end
end
