class AddFilePathToSecurities < ActiveRecord::Migration
  def change
    add_column :securities, :file_path, :string
  end
end
