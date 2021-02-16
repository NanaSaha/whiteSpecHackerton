class GroupEvent < ApplicationRecord

    validates :event_days,  allow_blank: false,:presence => { message: "Please enter the days of events"}
    validates :event_name,  allow_blank: false,:presence => { message: "Please enter event name"}
    validates :description,  allow_blank: false,:presence => { message: "Please enter event description"}
    validates :location,  allow_blank: false,:presence => { message: "Please enter event location"}
    validates :user_id,  allow_blank: false,:presence => { message: "Please enter user id"}


    #---Creating a new event will by default be in draft mode as we set Published to false
    #---Deleted, Published & Status all have a default value of 0
    #---So the user will have to either update the event to publish or delete status
    def self.create_events(event_days,event_name,description,location,user_id,event_start_time,event_end_time,event_duration)

        group_event = GroupEvent.new({:event_days => event_days, :event_name => event_name ,:description => description, :location => location ,:user_id => user_id, :deleted => 0 ,:published => 0, :status => 0, :event_start_time => event_start_time, :event_end_time => event_end_time, :event_duration => event_duration})
      
    end

    #---Displays all the events created ---
    def self.fetch_all_events
        GroupEvent.all

    end

    #---An event id is picked as a param and the event_start_time attribute is updated with the datetime of the event
    def self.update_start_of_event(event_id, event_start_time)
       
        GroupEvent.update(event_id, :event_start_time => event_start_time)

    end

    #---An event id is picked as a param and the event_end_time attribute is updated with the datetime of the event
    def self.update_end_of_event(event_id, event_end_time)
        GroupEvent.update(event_id, :event_end_time => event_end_time)

    end

    #---To determine the duration of event i calculate the difference between event_end_time and event_start_time
    def self.event_duration(event_id)

       get_event_object = GroupEvent.find_by(event_id)

       event_start_time = get_event_object.event_start_time
       event_end_time = get_event_object.event_end_time

       if event_start_time.nil?
        return  {"Duration": "None"}
       else
        duration = event_end_time - event_start_time
        
        hours = duration / 3600
        days = duration / 24.hours 
        minutes = duration / 60

        return {"Duration": {"Days":days, "Hours":hours, "Minutes":minutes }}
       end
     
    end


    #---Events are created as Draft so we update to publish by setting published to true
     def self.event_publish(event_id)
    
      get_event_object = GroupEvent.where(id: event_id)
      get_event_object.inspect

      published_status = GroupEvent.update(event_id, :published => true) 
      return {"Published":published_status.published}
      
    end

    #---Events are created with deleted set to false so we update to delete to true 
    #---Change Deleted Status to true and it is not erased from database
     def self.event_delete(event_id)   
      
       deleted_status = GroupEvent.update(event_id, :deleted => true) 
       return {"Deleted":deleted_status.deleted}
      
    end

end
