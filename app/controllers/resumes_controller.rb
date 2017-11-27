class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.job = @job
    # @resume.attachment =

    if @resume.save
      flash[:alert] = "上传成功"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content,:attachment)
  end
end
