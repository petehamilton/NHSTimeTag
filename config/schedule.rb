# On the day
every 1.day, :at => '7:30 am' do
  appointments = Appointment.all :condition => ["DATE(datetime) = DATE(?)", Time.now]
  appointment.each do |a|
    appointment.patient.contact("Reminder: You have an appointment today at #{a.datetime} with #{a.doctor.clinic_name}. Blah Blah...")
  end
end

# 3 Months before
every 1.day, :at => '7:30 am' do
  appointments = Appointment.all :condition => ["DATE(datetime) = DATE(?)", DateTime.now + 90]
  appointment.each do |a|
    appointment.patient.contact("Reminder: You have an appointment in 3 months. If for any reason... cancel, reschedule, check")
  end
end

# Docs link => http://github.com/javan/whenever
