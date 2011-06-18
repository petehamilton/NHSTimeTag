class Clinic < ActiveRecord::Base
  belongs_to :hospital
  has_many :doctors

  def status
    @doctors = self.doctors
      if @doctors.length > 0
      avgdelay = 0;
      @doctors.each do |d|
        avgdelay += d.current_delay
      end

      case (avgdelay / @doctors.length)
      when 0..20
        return "ontime"
      when 20..60
        return "delayed"
      else
        return "vdelayed"
      end
    end  
        return "ontime"
  end
  
  def status_text
    @doctors = self.doctors
      if @doctors.length > 0
        avgdelay = 0;
        @doctors.each do |d|
          avgdelay += d.current_delay
        end
        avgdelay = (avgdelay / @doctors.length);
        case avgdelay
        when 0..20
          return "On Time and Running Smoothly"
        when 20..60
          return "Slightly Delayed"
        else
          return "Very Delayed"
        end
    end    
         return "On Time and Running Smoothly"
  end
end