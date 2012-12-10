class CreateWorklogs < ActiveRecord::Migration
  def change
    create_table :worklogs do |t|
      t.integer :project_id
      t.string :logdoc
      t.time :time
      t.string :place
      t.integer :user_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
