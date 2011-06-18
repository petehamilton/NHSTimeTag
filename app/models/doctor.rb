class Doctor < ActiveRecord::Base
  belongs_to :clinic
  has_many :appointments
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def get_status
    case self.current_delay
      when 0..20
       return "Running on time"
      when 20..60
        return "Delayed"
      else
        return "Severely Delayed"
    end
  end
  
  def get_status_class
    case self.current_delay
      when 0..20
       return "not-delayed"
      when 20..60
        return "delayed"
      else
        return "severely-delayed"
    end
  end
end
