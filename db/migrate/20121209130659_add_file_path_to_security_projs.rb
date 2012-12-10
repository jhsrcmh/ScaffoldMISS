class AddFilePathToSecurityProjs < ActiveRecord::Migration
  def change
    add_column :security_projs, :file_path, :string
  end
end
