module JobsHelper
  def render_job_status(job)
     if job.is_hidden
       content_tag(:span, "未发布", class:"fa fa-lock")
     else
       content_tag(:span, "已发布", class:"fa fa-globe")
     end
  end
end
