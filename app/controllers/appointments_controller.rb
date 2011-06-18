class AppointmentsController < ApplicationController
  def index
    
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    @appointment.attending = false
    @appointment.save
  end
end
