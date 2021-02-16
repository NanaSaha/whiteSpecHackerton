require 'rails_helper'

RSpec.describe GroupEventsController, type: :controller do

describe 'POST #create_events' do
  context 'New Event created will have published status to be false' do
    it 'creates new event with published at status false' do
      
        create_ev = GroupEvent.create_events(20,"event_name","description","location","1","event_start_time","event_end_time","event_duration")  

      expect(response).to have_http_status(200)
      
    end
  end
end



describe 'POST #update_start_time' do
  context 'Event start time to be updated' do
    it 'updates event start time' do
      
     update_time =GroupEvent.update_start_of_event(1, "event_start_time") 

      expect(response).to have_http_status(200)
      
    end
  end
end


describe 'POST #update_end_time' do
  context 'Event endtime to be updated' do
    it 'updates event end time' do
      
     update_end_time =GroupEvent.update_end_of_event(1, "event_end_time") 

      expect(response).to have_http_status(200)
      
    end
  end
end


describe 'GET #check_event_duration' do
  context 'Calculates for Event Duration' do
    it 'measures the duration of the even' do
      
     duration = GroupEvent.event_duration("1") 
          expect(response)
      
    end
  end
end


describe 'POST #publish_event' do
  context 'Publish event by changing status' do
    let(:published) { {Published: true} }
    it 'update event publish status to show events' do
      
     publish_status =GroupEvent.event_publish(1) 

     expect(publish_status).to eq(published)
      expect(response).to have_http_status(200)
      
    end
  end
end


describe 'POST #delete_event' do
  context 'Delete event by changing status to true' do
   let(:deleted) { {Deleted: true} }
    it 'update status of deleted to true' do
 
     delete_status = GroupEvent.event_delete(1) 

     expect(delete_status).to eq(deleted)

      expect(response).to have_http_status(200)
      
    end
  end
end


end



