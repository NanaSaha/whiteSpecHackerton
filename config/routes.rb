Rails.application.routes.draw do
  resources :event_time_monitorings
  resources :group_events
  resources :users
  get 'home/index'

  root 'home#index'

  #Routes for creating a user
  post 'create_user' =>     'users#create_user'


  #Routes For Events
  post 'create_events' =>     'group_events#create_events'
  get 'view_all_events' =>     'group_events#view_all_events'
  post 'update_start_time' =>     'group_events#update_start_time'
  post 'update_end_time' =>     'group_events#update_end_time'
  get 'check_event_duration' =>  'group_events#check_event_duration' 
  post 'publish_event' =>  'group_events#publish_event' 
  post 'delete_event' =>  'group_events#delete_event' 
  
 
end
