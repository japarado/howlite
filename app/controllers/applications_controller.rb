class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /applications
  # GET /applications.json
  def index
    jobs = current_user.hr.jobs
    @applications = Array.new
    jobs.each do |job|
      job_faculties_map = Hash.new
      job_faculties_map[job] = Array.new
      if job.faculties.length > 0
        job.faculties.each do |faculty|
          job_faculties_map[job] << faculty
        end
        @applications << job_faculties_map
      end
    end
    @applications
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create

    current_user_id = current_user.id
    @faculty = User.find(current_user_id)
    faculty = current_user.faculty
    job = Job.find(params[:job_id])

    @test = User.find(job.hr.id)

    @third = Job.find(params[:job_id])


    #send mail
    #
    begin
    UserMailer.application_notification(@faculty,@test,@third).deliver
    faculty.jobs << job
    #@application = Application.new(:faculty => faculty, :job => job)
    #@application.save
    #respond_to do |format|
    #if @application.save
    #format.html { redirect_to @application, notice: 'Application was successfully created.' }
    #format.json { render :show, status: :created, location: @application }
    #else
    #format.html { render :new }
    #format.json { render json: @application.errors, status: :unprocessable_entity }
    #end
    #end
    rescue
      faculty.jobs << job
    end

    redirect_back(fallback_location: jobs_path)
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html {redirect_to @application, notice: 'Application was successfully updated.'}
        format.json {render :show, status: :ok, location: @application}
      else
        format.html {render :edit}
        format.json {render json: @application.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html {redirect_to applications_url, notice: 'Application was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def application_params
    params.fetch(:application, {}).permit(:job_id)
  end

end
