class CertificatesController < ApplicationController
  before_filter :authenticate_user!
  #before_filter is_current_user?

  # GET /certificates
  # GET /certificates.json
  def index
    #@certificates = Certificate.all
    @certificates = current_user.certificates.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @certificates }
    end
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show
    #@certificates = current_user.certificates.all
    #@certificate = @certificates.find(params[:id])
    #@certificate = current_user.certificates.all.find(params[:id])
    if current_user.id == Certificate.find(params[:id]).user_id
      @certificate = Certificate.find(params[:id])
    else
      redirect_to certificates_url, notice: 'You can only view your own certificates'
    end
  end

  # GET /certificates/new
  # GET /certificates/new.json
  def new
    @certificate = Certificate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @certificate }
    end
  end

  # GET /certificates/1/edit
#def edit
#    if current_user.id == Certificate.find(params[:id]).user_id
#      @certificate = Certificate.find(params[:id])
#    else
#      redirect_to certificates_url, notice: 'You can only edit your own certificates'
#    end
#  end

  # POST /certificates
  # POST /certificates.json
  def create
    @certificate = Certificate.new(params[:certificate])

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @certificate, notice: 'Certificate was successfully created.' }
        format.json { render json: @certificate, status: :created, location: @certificate }
      else
        format.html { render action: "new" }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /certificates/1
  # PUT /certificates/1.json
  def update
    @certificate = Certificate.find(params[:id])

    respond_to do |format|
      if @certificate.update_attributes(params[:certificate])
        format.html { redirect_to @certificate, notice: 'Certificate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate = Certificate.find(params[:id])
    @certificate.destroy

    respond_to do |format|
      format.html { redirect_to certificates_url }
      format.json { head :no_content }
    end
  end

 # def pdf
  #  pdf_filename = File.join(Rails.root, "/system/certificates/certificate_pdfs/000/000/007/thumb/19035122-V2W-LFCZ_(1).pdf")
   # send_file(pdf_filename, :filename => "19035122-V2W-LFCZ_(1).pdf", :disposition => 'inline', :type => "application/pdf")
    
  #end

  #def is_current_user?
  #  return current_user    
  #end

end
