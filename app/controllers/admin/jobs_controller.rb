class Admin::JobsController < ApplicationController

  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path notice:"新增职缺成功"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.delete
    flash[:warning] = "删除成功"
    redirect_to admin_jobs_path
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to admin_jobs_path
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  private
  
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end


  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound ,:contact_email, :is_hidden)
  end
end
