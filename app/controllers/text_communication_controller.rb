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
        where "reschedule"  
          appointment.attending = false
          # Something different happens here maybe?
        else
          # Handle whatever else they said, but how?
      end
    end
  end
end