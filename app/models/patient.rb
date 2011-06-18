class Patient < ActiveRecord::Base
  has_many :appointments
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def contact(message)
    if self.contact_text
      send_text_message(self.phone, message)
    end
    if self.contact_email
      PatientMailer.plain_email(self, message)
    end
  end
end