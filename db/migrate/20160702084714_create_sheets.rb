class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|

      t.integer :number
      t.text :member
      t.text :dots
      t.integer :projtct_id
      t.integer :user_id
      t.timestamps
    end
  end
end
