class Doctor < ActiveRecord::Base
  belongs_to :clinic
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
  
  def get_status
    case self.current_delay
      when 0..60
        return "Running on time"
      when 60..120
        return "Delayed"
      else
        return "Severely Delayed"
    end
  end
  
  def get_status_class
    case self.current_delay
      when 0..60
        return "not-delayed"
      when 60..120
        return "delayed"
      else
        return "severely-delayed"
    end
  end
end