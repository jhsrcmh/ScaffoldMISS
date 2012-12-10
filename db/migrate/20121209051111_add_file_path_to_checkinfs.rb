class AddFilePathToCheckinfs < ActiveRecord::Migration
  def change
    add_column :checkinfs, :file_path, :string
  end
end
