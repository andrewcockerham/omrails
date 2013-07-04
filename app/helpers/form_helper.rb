module FormHelper
	def setup_user(user)
		#user.job_experience ||= JobExperience.new
		2.times { user.job_experiences.build }
		user
	end
end