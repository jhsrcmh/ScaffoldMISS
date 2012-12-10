class AddFilePathToBackupinfs < ActiveRecord::Migration
  def change
    add_column :backupinfs, :file_path, :string
  end
end
