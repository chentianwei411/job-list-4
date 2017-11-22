class RenameDescriptioFromJobs < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.rename :descriptio, :description
    end
  end
end
