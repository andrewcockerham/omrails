class UsersController < ApplicationController
	def new
		@user = User.new(job_experience: JobExperience.new)
		#@job_experience = JobExperience.new(:user_id => 1) #current_user.user_id)
		#@job_experience.save
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to(@user, notice: "User was successfully created")
		else
			render :new
		end
	end
end
