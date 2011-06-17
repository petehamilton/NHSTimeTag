class Patient < ActiveRecord::Base
  has_many :appointments
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
end