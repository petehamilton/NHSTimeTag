class DoctorsController < ApplicationController
  def show
    puts "Do nothing!"
  end
  
  def get_cancellations
    @last_polled = Time.at(params[:last_polled].to_i)
    
    if params[:id]
      @doctor = Doctor.find(params[:id])
      @cancelled_appointments = @doctor.appointments.where("updated_at > ? AND attending = ?", @last_polled, false)
    else
      @cancelled_appointments = Appointment.where("updated_at > ? AND attending = ?", @last_polled, false)
    end
    
    puts @cancelled_appointments.inspect
    
    respond_to do |format|
      format.json{ render :json => @cancelled_appointments.to_json }
    end
  end
end