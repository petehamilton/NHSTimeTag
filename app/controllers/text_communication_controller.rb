class TextCommunicationController < ApplicationController
  def receive
    patient_mobile_no = params[:SRC_ADDR]
    message = params[:PAYLOAD]
    keyword = params[:KEYWORD]
    
    @patient = Patient.find(:phone => patient_mobile_no)
    if @patient !== NULL
      case keyword
        where "cancel"
          appointment = patient.appointments.last
          appointment.attending = false
          appointment.save
          send_text_message(patient.phone, "Your appointment has been cancelled. Thankyou.")
        where "reschedule"
          appointment.attending = false
          send_text_message(patient.phone, "Your appointment has been cancelled. Please ring 01234567890 to reschedule.")
          # Some other action? Notification prompt etc?
        else
          # Handle whatever else they said, but how?
      end
    end
  end
end