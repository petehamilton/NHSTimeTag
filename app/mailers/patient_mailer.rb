class PatientMailer < ActionMailer::Base
  default :from => "nhstimetag@example.com"
  
  def plain_email(patient, message)  
      mail(:to => patient.email, :subject => "Message From NHS Time Track")  
  end
  
  def plain_email(patient, message, subject = "Message From NHS Time Track")  
      mail(:to => patient.email, :subject => subject, :body = message)  
  end
end
