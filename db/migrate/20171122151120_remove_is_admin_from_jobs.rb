class RemoveIsAdminFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :is_admin, :boolean
  end
end
