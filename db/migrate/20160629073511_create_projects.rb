class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.text :member
      t.string :name
      t.timestamps
    end
  end
end
