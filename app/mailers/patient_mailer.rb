class PatientMailer < ActionMailer::Base
  default :from => "nhstimetag@example.com"
  default :subject => "Message From NHS Time Track"
  
  def plain_email(patient, message)  
      mail(:to => patient.email, :body = message)  
  end
  
  def plain_email(patient, message)
      mail(:to => patient.email, :body = message)
  end
end
