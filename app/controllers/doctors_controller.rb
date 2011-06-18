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
    if params[:id]
      @doctor = Doctor.find(params[:id])
      @appointments = @doctor.appointments.where("attending = ? AND notifiable = ?", false, true)
    else
      @appointments = Appointment.where("attending = ? AND notifiable = ?", false, true)
    end
    
    @appointments.each do |appointment|
      appointment.notifiable = false
      appointment.save
    end
    
    puts @appointments.inspect
    
    render :partial => "recent_cancellations"
  end

  def update_delay
    doctor = Doctor.find(params[:id])
    doctor.current_delay = params[:delay]
    doctor.save
    
    puts "Updated Doctor!"
    
    render :json => {"status_class" => doctor.get_status_class, "status_message" => doctor.get_status}.to_json
  end

end
