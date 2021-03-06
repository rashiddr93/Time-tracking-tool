class HomeController < ApplicationController
	  before_action :authenticate_user!
	  before_action :complete_profile
	  before_action :save_location
	  #&format=json&callback=
	  def index
	  	if current_user.role == "Manager"
      		redirect_to '/admin'
    	end
	  	@user=current_user
	  	@projects=Project.latest_projects
	  	@new_join=User.new_joiners
	  	@training=Training.latest_training
		@user_birthday_recent=User.birthday_ordered_asc
	  end
end
