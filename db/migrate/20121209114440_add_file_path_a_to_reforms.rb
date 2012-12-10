class AddFilePathAToReforms < ActiveRecord::Migration
  def change
    add_column :reforms, :file_path_a, :string
    add_column :reforms, :file_path_b, :string
  end
end
