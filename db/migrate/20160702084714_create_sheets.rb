class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|

      t.integer :number
      t.text :member
      t.string :dots
      t.integer :x
      t.integer :y
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
