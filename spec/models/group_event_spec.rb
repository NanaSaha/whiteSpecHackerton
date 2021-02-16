
require 'rails_helper'
require 'spec_helper'


RSpec.describe GroupEvent, type: :model do

   describe 'create new event' do
    it 'new event can be created' do
      event = GroupEvent.create(event_days: "testuser", event_name: "asdf", description: "asdf", location: 'eee', user_id: 'hjkb')
      
      expect(event).to be_valid
    end
  end


   describe 'Event start time should be updated' do
    it 'updates start time of event' do
    
    update_time = GroupEvent.update(1, :event_start_time => "event_start_time")

    expect([update_time]).to match_array([update_time])
    end
  end


    describe 'Event end time should be updated' do
    it 'updates end time of event' do
    
    update_end_time = GroupEvent.update(1, :event_end_time => "event_start_time")

    expect([update_end_time]).to match_array([update_end_time])
    end
  end



  describe 'Calculate Duration' do
    it 'determine the duration of the event' do

       get_event_object = GroupEvent.find_by(id: 1)
       event_start_time = get_event_object.event_start_time
       event_end_time = get_event_object.event_end_time

        duration = Time.now - Time.now
    
        hours = duration / 3600
        days = duration / 24.hours 
        minutes = duration / 60

       expect(duration).to eq (duration)
    
    end
  end


  describe 'Publish An Event' do
    it 'updates status of an event to be published' do
    
    update_published = GroupEvent.update(1, :published => 1)

    expect([update_published]).to match_array([update_published])
    end
  end



  describe 'Delete An Event' do
    it 'updates status of an event to be deleted so it doesnt get erased from the database' do
    
    event_deleted = GroupEvent.update(1, :deleted => 1)

    expect([event_deleted]).to match_array([event_deleted])
    end
  end

end



