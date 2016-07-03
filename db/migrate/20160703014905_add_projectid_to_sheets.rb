class AddProjectidToSheets < ActiveRecord::Migration
  def change
    add_column :sheets, :project_id, :integer
  end
end
