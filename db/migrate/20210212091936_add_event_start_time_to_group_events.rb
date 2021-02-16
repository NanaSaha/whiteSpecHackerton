class AddEventStartTimeToGroupEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :group_events, :event_start_time, :datetime
  end
end
