class UsersController < ApplicationController
	before_action :authenticate_user!
	def list_users
		@user=User.all
	end
	def show
		@user=User.find(params[:id])
	end
	def new_joiners
		@new_join=User.new_joiners
	end
	def birthdays
		@user_birthday_recent=User.birthday_ordered_asc
	end
	def edit_profile
		@user=current_user
	end
	def update_profile
		@user=User.find(current_user.id)
		if(@user.update(user_params))
			flash[:notice] = "Profile edited successfully"
  			redirect_to root_path
  		else
  			render 'edit_profile'
  		end
	end
	private
	def user_params
    	params.require(:user).permit(:user_pic,:first_name, :last_name, :place, :dob, :username, :email)
  	end 
end
