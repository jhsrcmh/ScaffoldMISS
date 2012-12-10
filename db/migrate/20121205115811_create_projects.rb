class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projname
      t.string :projinf
      t.integer :security_id
      t.integer :ifon
      t.integer :user_id
      t.time :time
      t.text :remarkinf

      t.timestamps
    end
  end
end
