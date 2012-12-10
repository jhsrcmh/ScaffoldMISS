class CreateBackupTypes < ActiveRecord::Migration
  def change
    create_table :backup_types do |t|
      t.string :backuptypename
      t.integer :importance

      t.timestamps
    end
  end
end
