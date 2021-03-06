namespace :invite do

  desc "Checks whether scheduled events have passed, and resets all the attendance and event information if they have."

  task :update_invitations => :environment do
    current_time = DateTime.now.to_f
    Event.where(:active => true).each do |event|
      event_date = DateTime.parse(event[:date]).strftime('%s').to_f
      event_time = DateTime.parse(event[:time]).to_f - (DateTime.parse(event[:time]).beginning_of_day.to_f)
      actual_time = event_date + event_time


      if (current_time - actual_time - 25200) > 0
        event[:date] = nil
        event[:time] = nil
        event[:min] = 1
        event[:max] = nil
        event[:active] = false
        event.save

        Attendance.where(:event_id => event[:id]).each do |user|
          user.destroy
        end
      end
    end
  end




end