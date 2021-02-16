class CreateGroupEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_events do |t|
      t.integer :event_days
      t.string :event_name
      t.string :description
      t.string :location
      t.integer :user_id
      t.boolean :deleted
      t.boolean :published
      t.boolean :status

      t.timestamps
    end
  end
end
