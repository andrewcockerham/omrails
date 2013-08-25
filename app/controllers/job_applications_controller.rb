class JobApplicationsController < ApplicationController
  # GET /job_applications
  # GET /job_applications.json
  def index
    #@job_applications = JobApplication.all
    @job_applications = current_user.job_applications.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_applications }
    end
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
    #@job_application = JobApplication.find(params[:id])

    #@user = User.find(params[:id])
    @job_application = current_user.job_applications #.page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_application }
    end
  end

  # GET /job_applications/new
  # GET /job_applications/new.json
  def new
    #@job_application = JobApplication.new
    @job_application = JobApplication.new(params[:job_application])
    @job_posting = JobPosting.find(params[:job_application][:job_posting_id])
    #@job_application.job_posting_id = @job_posting.id
    #@job_application.job_posting_id = params[:job_application][:job_posting_id]
    #@job_application.job_posting_id = @job_posting.id
    #@job_application = JobApplication.find(params[:job_posting_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_application }
    end
  end

  # GET /job_applications/1/edit
  def edit
    @job_application = current_user.job_applications.find(params[:id])
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    #@job_application = JobApplication.new(params[:job_application])
    @job_application = current_user.job_applications.new(params[:job_application])
    #@job_application.job_posting_id = JobPostings.find(params[:job_posting_id]) #  job_posting.id 
    #@job_posting = JobPosting.find(params[:job_posting_id])
    #@job_application.job_posting_id = @job_posting.id
    #@job_application.job_posting_id = params[:job_application][:job_posting_id]

    respond_to do |format|
      if @job_application.save
        # send email to HR person who posted the job
        @job_posting = JobPosting.find(@job_application.job_posting_id)
        @HR_person = User.find(@job_posting.user_id)
        RecieveApplicationMailer.recieve_application_email(@HR_person, @job_application).deliver

        format.html { redirect_to @job_application, notice: 'Job application was successfully created.' }
        format.json { render json: @job_application, status: :created, location: @job_application }
      else
        format.html { render action: "new" }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_applications/1
  # PUT /job_applications/1.json
  def update
    @job_application = JobApplication.find(params[:id])

    respond_to do |format|
      if @job_application.update_attributes(params[:job_application])
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy

    respond_to do |format|
      format.html { redirect_to job_applications_url }
      format.json { head :no_content }
    end
  end
end
