class EventTimeMonitoringsController < ApplicationController
  before_action :set_event_time_monitoring, only: %i[ show edit update destroy ]

  # GET /event_time_monitorings or /event_time_monitorings.json
  def index
    @event_time_monitorings = EventTimeMonitoring.all
  end

  # GET /event_time_monitorings/1 or /event_time_monitorings/1.json
  def show
  end

  # GET /event_time_monitorings/new
  def new
    @event_time_monitoring = EventTimeMonitoring.new
  end

  # GET /event_time_monitorings/1/edit
  def edit
  end

  # POST /event_time_monitorings or /event_time_monitorings.json
  def create
    @event_time_monitoring = EventTimeMonitoring.new(event_time_monitoring_params)

    respond_to do |format|
      if @event_time_monitoring.save
        format.html { redirect_to @event_time_monitoring, notice: "Event time monitoring was successfully created." }
        format.json { render :show, status: :created, location: @event_time_monitoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_time_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_time_monitorings/1 or /event_time_monitorings/1.json
  def update
    respond_to do |format|
      if @event_time_monitoring.update(event_time_monitoring_params)
        format.html { redirect_to @event_time_monitoring, notice: "Event time monitoring was successfully updated." }
        format.json { render :show, status: :ok, location: @event_time_monitoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_time_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_time_monitorings/1 or /event_time_monitorings/1.json
  def destroy
    @event_time_monitoring.destroy
    respond_to do |format|
      format.html { redirect_to event_time_monitorings_url, notice: "Event time monitoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_time_monitoring
      @event_time_monitoring = EventTimeMonitoring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_time_monitoring_params
      params.require(:event_time_monitoring).permit(:group_events_id, :event_start_time, :event_end_time, :event_duration)
    end
end
