class PatientMailer < ActionMailer::Base
  default :from => "nhstimetag@example.com"
  default :subject => "Message From NHS Time Track"
  
  def plain_email(patient, message)  
      mail(:to => patient.email)  
  end
  
  def plain_email(patient, message)  
      mail(:to => patient.email, :subject => subject, :body = message)  
  end
end
