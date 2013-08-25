class RecieveApplicationMailer < ActionMailer::Base
  default from: "andrew@skillchest.com"

  def recieve_application_email(user, job_application)
  	@user = user
  	@job_application = job_application
  	@url = 'http://www.skillchest.com'

  	mail(to: @user.email, subject: 'Someone has applied for your job posting')
  	
  end
end
