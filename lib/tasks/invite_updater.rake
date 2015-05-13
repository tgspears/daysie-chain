namespace :invite do

  desc "Checks whether scheduled events have passed, and resets all the attendance and event information if they have."

  task :update_invitations => :environment do

    current_date = (Time.new.strftime('%s').to_i) * 1000
    Event.where(:active => true).each do |event|
      event_date = Date.parse(event[:date]).strftime('%Q').to_i

      if (current_date - event_date) > 0
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