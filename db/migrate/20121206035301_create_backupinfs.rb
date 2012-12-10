class CreateBackupinfs < ActiveRecord::Migration
  def change
    create_table :backupinfs do |t|
      t.string :name
      t.string :backinf
      t.integer :backupclass_id
      t.integer :project_id
      t.integer :user_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
