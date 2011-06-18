class ClinicsController < ApplicationController
  def index
    @clinics = Hospital.all.first.clinics
    puts @clinics.inspect
  end
  
  def show
    @clinic = Clinic.find(params[:id])
    @doctors = @clinic.doctors
    @hospital = @clinic.hospital
    puts @doctors.inspect
  end
end