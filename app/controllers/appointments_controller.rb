class AppointmentsController < ApplicationController
  def index
    
  end

  def cancel
    @appointment = Appointment.find(params[:id])
    if params[:reschedule]
      @appointment.reschedule = true
    end
    @appointment.attending = false
    @appointment.save
  end
end
