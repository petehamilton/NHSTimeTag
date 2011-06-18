class ClinicsController < ApplicationController
  def index
    if params[:id]
      @clinics = Hospital.find(params[:id]).clinics
    else
      @clinics = Hospital.all.last.clinics
    end
    puts @clinics.inspect
  end
  def show
    @clinic = Clinic.find(params[:id])
    @doctors = @clinic.doctors
  end
end
