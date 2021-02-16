class CreateEventTimeMonitorings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_time_monitorings do |t|
      t.integer :group_events_id
      t.datetime :event_start_time
      t.datetime :event_end_time
      t.datetime :event_duration

      t.timestamps
    end
  end
end
