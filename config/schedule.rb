# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

every 1.day, :at => '7:30 am' do 
  appointments = Appointment.all :condition => ["DATE(datetime) = DATE(?)", Time.now]
  appointment.each do |a|
    appointment.patient.contact("Reminder: You have an appointment today at #{a.datetime} with #{a.doctor.clinic_name}. Blah Blah...")
  end
end

# Learn more: http://github.com/javan/whenever
