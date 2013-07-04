class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@pins = @user.pins.page(params[:page]).per_page(20)
	end

	def new
	#	@user = User.new(job_experience: JobExperience.new)
#		super
#		@user = User.new
	end

	def create
#		super
	#	@user = User.new(params[:user])
	#	if @user.save
	#		redirect_to(@user, notice: "User was successfully created")
			#redirect_to(next page from ppt)
	#	else
	#		render :new
	#	end

	# from tutorial
#		@user = User.new(params[:user])
#	    if @user.save
#	      redirect_to @user
#	    else
#	      render :action => 'new'
#	    end

	end

	# from tutorial
#	def update
#		super
#    @user = User.find(params[:id])
#    if @user.update(params[:user])
#      redirect_to @user
#    else
#      render :action => 'edit'
#    end
#  end

end
