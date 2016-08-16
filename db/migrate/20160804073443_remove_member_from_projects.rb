class RemoveMemberFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :member, :text
  end
end
