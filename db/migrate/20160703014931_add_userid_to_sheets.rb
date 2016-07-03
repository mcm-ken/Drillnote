class AddUseridToSheets < ActiveRecord::Migration
  def change
    add_column :sheets, :user_id, :integer
  end
end
