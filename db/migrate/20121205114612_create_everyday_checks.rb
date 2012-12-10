class CreateEverydayChecks < ActiveRecord::Migration
  def change
    create_table :everyday_checks do |t|
      t.integer :project_id
      t.integer :everydaychecktype_id
      t.string :everydaycheckform
      t.integer :user_id
      t.time :checktime
      t.text :remarkinf

      t.timestamps
    end
  end
end
