class AddFilePathToCloseinfs < ActiveRecord::Migration
  def change
    add_column :closeinfs, :file_path, :string
  end
end
