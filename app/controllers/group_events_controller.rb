class GroupEventsController < ApplicationController
  before_action :set_group_event, only: %i[ show edit update destroy ]

  # GET /group_events or /group_events.json
  def index
    @group_events = GroupEvent.all
  end



  # GET /group_events/new
  def new
    @group_event = GroupEvent.new
  end



  #-----------ENDPOINTS FOR THE API SESSIONS-----------------------

  #---New Event created will have published status to be false which equals a Draft
  #---So the user will have to either update the event to publish or delete status
  def create_events

    event_days = params[:group_event][:event_days]
    event_name = params[:group_event][:event_name] 
    description = params[:group_event][:description]
    location = params[:group_event][:location]  
    user_id = params[:group_event][:user_id]   
    event_start_time = params[:group_event][:event_start_time]
    event_end_time = params[:group_event][:event_end_time]
    event_duration = params[:group_event][:event_duration]
   
    @save_events = GroupEvent.create_events(event_days,event_name,description,location,user_id,event_start_time,event_end_time,event_duration)  

    if @save_events.save
    render json: {"status": 200, "message": "Event Created Successfully"}
  
    else
    render json: {"status": 400, "message": "Check Validation!!"}
    end


  end

  #--Displays all the events created ---
  def view_all_events
    all_events = GroupEvent.fetch_all_events

     respond_to do |format|
       format.json { render json:  all_events.to_json }
       
      end

  end

   #---An event id is picked as a param and the event_start_time attribute is updated with the datetime of the event. Here the method in the model is called
  def update_start_time
    event_id = params[:event_id]
    event_start_time = params[:event_start_time] 

    update_time =  GroupEvent.update_start_of_event(event_id, event_start_time)
    
    if update_time
    
      render json: {"status": 200, "message": "Update Event Start time Successfully"}
      else
         render json: {"status": 400, "message": "Check Validation!!"}
      end

  end

    #---An event id is picked as a param and the event_end_time attribute is updated with the datetime of the event. Here the method in the model is called
   def update_end_time
    event_id = params[:event_id]
    event_end_time = params[:event_end_time] 

    update_time =GroupEvent.update_end_of_event(event_id, event_end_time)
    
    if update_time

      render json: {"status": 200, "message": "Update Event End time Successfully"}
      else
         render json: {"status": 400, "message": "Check Validation!!"}
      end

  end

   #---To determine the duration of event i calculate the difference between event_end_time and event_start_time
  def check_event_duration
    event_id = params[:event_id]

    duration =  GroupEvent.event_duration(event_id)
    render json:  duration 

  end


  #---Updatng published value to true
  def publish_event
   event_id = params[:event_id]

   publish_status =  GroupEvent.event_publish(event_id)
   render json:  publish_status 

  end

  #---Updatng deleted value to true
  def delete_event
   event_id = params[:event_id]

   delete_status =  GroupEvent.event_delete(event_id)
   render json:  delete_status 

  end

   #------------------END OF API ENDPOINTS-----------------------------

  # # POST /group_events or /group_events.json
  # def create
  #   @group_event = GroupEvent.new(group_event_params)

  #   respond_to do |format|
  #     if @group_event.save
  #       format.html { redirect_to root_path, notice: "Group event was successfully created." }
  #       format.json { render :show, status: :created, location: @group_event }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @group_event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /group_events/1 or /group_events/1.json
  # def update
  #   respond_to do |format|
  #     if @group_event.update(group_event_params)
  #       format.html { redirect_to @group_event, notice: "Group event was successfully updated." }
  #       format.json { render :show, status: :ok, location: @group_event }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @group_event.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /group_events/1 or /group_events/1.json
  # def destroy
  #   @group_event.destroy
  #   respond_to do |format|
  #     format.html { redirect_to group_events_url, notice: "Group event was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_event_params
      params.require(:group_event).permit(:event_days, :event_name, :description, :location, :user_id, :deleted, :published, :status, :event_start_time,:event_end_time,:event_duration)
    end
end
