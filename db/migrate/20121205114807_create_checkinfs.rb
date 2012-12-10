class CreateCheckinfs < ActiveRecord::Migration
  def change
    create_table :checkinfs do |t|
      t.integer :project_id
      t.integer :checkclass_id
      t.string :checkform
      t.integer :user_id
      t.time :checktime
      t.text :remarkinf

      t.timestamps
    end
  end
end
