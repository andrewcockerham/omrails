class JobExperiencesController < ApplicationController
  # GET /job_experiences
  # GET /job_experiences.json
  def index
    @job_experiences = JobExperience.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_experiences }
    end
  end

  # GET /job_experiences/1
  # GET /job_experiences/1.json
  def show
    @job_experience = JobExperience.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_experience }
    end
  end

  # GET /job_experiences/new
  # GET /job_experiences/new.json
  def new
    @job_experience = JobExperience.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_experience }
    end
  end

  # GET /job_experiences/1/edit
  def edit
    @job_experience = JobExperience.find(params[:id])
  end

  # POST /job_experiences
  # POST /job_experiences.json
  def create
    @job_experience = JobExperience.new(params[:job_experience])

    respond_to do |format|
      if @job_experience.save
        format.html { redirect_to @job_experience, notice: 'Job experience was successfully created.' }
        format.json { render json: @job_experience, status: :created, location: @job_experience }
      else
        format.html { render action: "new" }
        format.json { render json: @job_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_experiences/1
  # PUT /job_experiences/1.json
  def update
    @job_experience = JobExperience.find(params[:id])

    respond_to do |format|
      if @job_experience.update_attributes(params[:job_experience])
        format.html { redirect_to @job_experience, notice: 'Job experience was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_experiences/1
  # DELETE /job_experiences/1.json
  def destroy
    @job_experience = JobExperience.find(params[:id])
    @job_experience.destroy

    respond_to do |format|
      format.html { redirect_to job_experiences_url }
      format.json { head :no_content }
    end
  end
end
