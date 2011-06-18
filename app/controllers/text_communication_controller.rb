class TextCommunicationController < ApplicationController
  def receive
    patient_mobile_no = params[:SRC_ADDR]
    message = params[:PAYLOAD]
    keyword = params[:KEYWORD]
    
    @patient = Patient.find(:phone => patient_mobile_no)
    if @patient !== NULL
      appointment = patient.appointments.last
      case keyword
        where "check"
          doctor = appointment.doctor
          if doctor.current_delay == 0
            patient.contact("We are currently running on schedule")
          elsif doctor.current_delay < 60
            patient.contact("Appointments for #{doctor.title} #{doctor.last_name} are currently delayed by #{doctor.current_delay} minutes")
          elsif doctor.current_delay > 60
            patient.contact("Appointments for #{doctor.title} #{doctor.last_name} are currently delayed by #{doctor.current_delay} minutes")
          end
        where "cancel"
          appointment.attending = false
          appointment.save
          patient.contact("Your appointment has been cancelled. Thankyou.")
        where "reschedule"
          appointment.attending = false
          appointment.save
          patient.contact("Your appointment has been cancelled. Please ring 01234567890 to reschedule.")
          # Some other action? Notification prompt etc?
        else
          # Handle whatever else they said, but how?
      end
    end
  end
end