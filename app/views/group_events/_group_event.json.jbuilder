json.extract! group_event, :id, :event_days, :event_name, :description, :location, :user_id, :deleted, :published, :status, :created_at, :updated_at
json.url group_event_url(group_event, format: :json)
