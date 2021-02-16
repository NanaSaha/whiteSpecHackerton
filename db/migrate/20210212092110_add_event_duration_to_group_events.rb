class AddEventDurationToGroupEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :group_events, :event_duration, :datetime
  end
end
