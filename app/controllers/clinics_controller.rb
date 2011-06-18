class ClinicsController < ApplicationController
  def index
    if params[:id]
      @clinics = Hospital.find(params[:id]).clinics
      render 'index'
    else
      @clinics = Hospital.all.last.clinics
      render 'index2'
    end
  end
  
  def show
    @clinic = Clinic.find(params[:id])
    @doctors = @clinic.doctors
    @hospital = @clinic.hospital
    puts @doctors.inspect
  end
end
