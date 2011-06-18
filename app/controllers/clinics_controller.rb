class ClinicsController < ApplicationController
  def index
    if params[:hospital_id]
      @clinics = Hospital.find(params[:hospital_id]).clinics
    else
      @clinics = Hospital.all.first.clinics
    end
    puts @clinics.inspect
  end
  
  def show
    @clinic = Clinic.find(params[:id])
    @doctors = @clinic.doctors
    @hospital = @clinic.hospital
    puts @doctors.inspect
  end
end
