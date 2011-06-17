class Doctor < ActiveRecord::Base
  belongs_to :clinic
  
  def name
    return "#{self.first_name} #{self.last_name}"
  end
end