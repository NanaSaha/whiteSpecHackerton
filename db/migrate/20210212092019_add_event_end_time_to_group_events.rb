class AddEventEndTimeToGroupEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :group_events, :event_end_time, :datetime
  end
end
