namespace :invite do

  desc "Checks whether scheduled events have passed, and resets all the attendance and event information if they have."

  task :update_invitations => :environment do

     p "*" * 20
     p "At least I know this is running 0"
     p "*"
    current_time = Time.now.to_i
    Event.where(:active => true).each do |event|
      event_date = Date.parse(event[:date]).strftime('%s').to_i
      event_time = Time.parse(event[:time]).to_i
      actual_time = event_date + event_time

      if (current_time - actual_time) > 0
         p "*" * 20
         p "At least I know this is running"
         p "*"
        event[:date] = nil
        event[:time] = nil
        event[:min] = 1
        event[:max] = nil
        event[:active] = false
        event.save

        Attendance.where(:event_id == event[:id]).each do |user|
          user[:yes] = false
          user[:no] = false
          user[:maybe] = false
          user[:invited] = false
          user.save
        end
      end
    end
  end


end