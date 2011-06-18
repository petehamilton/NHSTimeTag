class DoctorsController < ApplicationController

  def show
    puts "Do nothing!"
  end
  
  def get_appointments
    if params[:id]
      @doctor = Doctor.find(params[:id])
      @appointments = @doctor.appointments
    else
      @appointments = Appointment.all
    end

    render :partial => "appointments"
  end

  def get_cancellations
    @last_polled = Time.at(params[:last_polled].to_i)
    
    if params[:id]
      @doctor = Doctor.find(params[:id])
      @appointments = @doctor.appointments.where("updated_at > ? AND attending = ?", @last_polled, false)
    else
      @appointments = Appointment.where("updated_at > ? AND attending = ?", @last_polled, false)
    end
    
    # @appointments.each do |appointment|
    #   appointment.touch
    #   appointment.save
    # end
    
    puts @appointments.inspect
    
    render :partial => "recent_cancellations"
  end

  def update_delay
    doctor = Doctor.find(params[:id])
    doctor.current_delay = params[:delay]
    doctor.save
    render :nothing => true
  end

end
