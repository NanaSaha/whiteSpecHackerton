class HomeController < ApplicationController
  def index

    #Display all users and events created on the homepage
     @users = User.all
     @group_events = GroupEvent.fetch_all_events
      
  end
end
