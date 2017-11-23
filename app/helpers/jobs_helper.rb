module JobsHelper
  def render_job_status(job)
     if job.is_hidden
       "已经隐藏"
     else
       "已经发布"
     end 
  end
end
